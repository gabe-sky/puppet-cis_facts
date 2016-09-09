:see_no_evil: :hear_no_evil: :speak_no_evil: **This is a
PROOF-OF-CONCEPT, and not intended to be used in production in ANY way.
It's not tested fully, and is probably broken in multiple ways.**

# Overview

This repository contains a prototype or proof-of-concept.  Its aim is to
provide Facter facts that reflect a node's compliance with CIS
benchmarks.  Currently this is only implemented for nodes running

  * CIS 2.0.1 -- CentOS Linux 7

You can download the CIS benchmarks from their site.

  https://benchmarks.cisecurity.org/downloads/latest/

# Philosophy

Perfect is the enemy of a functional bunch of pokes at the problem.
Rather than aim for a "product," let's just throw this out and see what
happens.

Make it easy for the less-technical folks to read.  All facts in this
project use the actual commands that the CIS guidelines list for each
item.  We could implement the facts using "real" classes like File.  To
an auditor, however, using the actual commands that they're looking for
is way easier than trying to explain to them what cleverness you're
doing in Ruby code.

Don't dither.  When you mention this idea to someone, they invariably
start brainstorming.  Theoretical discussion is fun!  But this does not
result in code or pull requests.

Make it super easy to discover and report nodes' status.  Using facts
means that a person can use an `mco` command with a cleverly-crafted
`--select` flag to quickly get a report of machines that are failing
some certain test.  Or you could do a PuppetDB query.  Or look in the
Enterprise Console.  Using facts makes these things easy.


# Implementation

## Ruby-based facts

Most individual guidelines just use Facter::Core::Execution.exec() to
run the command listed in the benchmark document.  Based on the result
of that command, if the guideline passes nothing is done, and if the
guideline is failed, its identity is added to an array of failing
guidelines.

For the RedHat benchmark, the arrays of failing guidelines are broken up
into multiple facts that span an X.Y section of the guideline.  For
other systems, like AIX, the arrays should span an X.Y.Z section of
their respective guideline.  The goal is to have a dozen or so checks'
status collapsed into each sub-section grouping.

### Library-based fact creation

This implementation uses a separate ruby library for each section of
each benchmark. The framework for each of these libraries is [generated
programmatically](#converting-the-pdfs) and then manually edited to
provide the test information.

Every benchmark has a single fact file that is used by `facter` to
generate the structured facts. For example, the file for the CentOS 7
benchmark is named `cis_centos7.rb`. This file references additional
class libraries (one for each section), which are stored in the `util/`
directory. Continuing our example, the `util/` contains six files:

* `CIS_1_CentOS7.rb`
* `CIS_2_CentOS7.rb`
* `CIS_3_CentOS7.rb`
* `CIS_4_CentOS7.rb`
* `CIS_5_CentOS7.rb`
* `CIS_6_CentOS7.rb`

Each of these external class library files is effectively a DSL data
structure wrapped in appropriate class code to allow it to be called
from the `facter` fact (i.e., `cis_centos7.rb`, in this case).

### The "DSL"

#### The `@@results` data structure

An instance of the data structure containing the DSL is instantiated
individually in each of the external class libraries, and is named
`@@results`. This is a hash where every non-[leaf node](#leaf-nodes)
hash key is a stringified integer. For example, the test _2.1.2 Ensure
daytime services are not enabled_ is exists in the DSL data structure at
`@@result["2"]["1"]["2"]`.

Each branch of the data structure can be of different length, but
**must** terminate with a [leaf node](#leaf-nodes).

#### Leaf Nodes

A "leaf node" is the data structure at the termination point of a hash
branch. It represents a single test in the benchmark. It is a hash with
the following keys:

|    Key    |  Value Data Type   | Required | Auto-Generated | Auto-Populated |
| :-------: | :----------------: | :------: | :------------: | :------------: |
| `:title`  | String             |   :x:    |      :x:       |                |
| `:scored` | Boolean            |   :x:    |      :x:       |                |
| `:level`  | Hash               |   :x:    |      :x:       |                |
| `:result` | `:nodata`          |   :x:    |      :x:       |      :x:       |
| `:exec`   | Hash               |   :x:    |      :x:       |                |
| `:data`   | `Hash.new`         |   :x:    |      :x:       |      :x:       |
| `:test`   | `Proc.new { ... }` |   :x:    |                |                |

_Auto-Generated_ values are values that are pre-populated with the
appropriate values by the [conversion script](#converting-the-pdfs) and
(generally) don't require any changes by the person updating the
auto-generated tests. However, this isn't always the for keys such as
`:exec` that may need a little tweaking after the conversion. Keys not
marked _Auto-Generated_ need to be updated after the conversion.

_Auto-Populated_ keys are those whose value will be automatically
calculated and populated by the class file itself. The _Value Data Type_
literals shown here should be used exactly as shown.


Here is an example of a leaf node block code that also includes a
reference to another test:

```ruby
  # 2.2.1.3 Ensure chrony is configured
  @@results['2']['2']['1']['3'] = {
    :title  => "Ensure chrony is configured",
    :scored => true,
    :level  => {
                 :server      => '1',
                 :workstation => '1',
               },
    :result => :nodata,
    :exec   => {
                 'grep1' => 'grep "^server" /etc/chrony.conf',
                 'grep2' => 'grep ^OPTIONS /etc/sysconfig/chronyd',
               },
    :data   => Hash.new,
    :test   => Proc.new {
                 this   = @@results['2']['2']['1']['3']
                 parent = @@results['2']['2']['1']['1']
                 if ( parent[:data]['rpm_chrony'] == 'package chrony is not installed' ) then
                   this[:result] = :skip
                 else
                   if ( this[:data]['grep1'] !~ /server\s+\S+/ ||
                        this[:data]['grep2'] !~ /OPTIONS="-u chrony"/ ) then
                     this[:result] = :fail
                   else
                     this[:result] = :pass
                   end
                 end
               },
  }

```

The [conversion script](#converting-the-pdfs) will auto-generate this
structure for you.

Let's look at each leaf node key using the example code from above as a
reference.

##### `:title`

```ruby
    :title  => "Ensure chrony is configured",
```

The `:title` key is the name of the test. It should exactly match the
name given in the benchmark for ease of managing reports later.

##### `:scored`

```ruby
    :scored => true,
```

The `:scored` key's value must be either `true` or `false` and
represents whether or not this particular test is scored (see the CIS
documentation for more information on scoring).

##### `:level`

```ruby
    :level  => {
                 :server      => '1',
                 :workstation => '1',
               },
```

`:level` is used to specify the impact level of the test depending on
whether one is on a server or a workstation. Both the `:server` and
`:workstation` keys are **required** in this hash. Their values **must**
be either the string `'1'` or `'2'`.

##### `:result`

```ruby
    :result => :nodata,
```

`:result` is to be auto-populated with one of the following values when
the tests are run by the ruby `Proc` stored in [`:test`](#test):

* `:pass` : The test passed successfully.
* `:fail` : The test failed.
* `:skip` : The test was skipped due to dependencies or not being able
  to programmatically execute the test.

As it is auto-populated, `:nodata` **should** be used within the DSL
definition of the leaf node.

##### `:exec`

```ruby
    :exec   => {
                 'grep1' => 'grep "^server" /etc/chrony.conf',
                 'grep2' => 'grep ^OPTIONS /etc/sysconfig/chronyd',
               },
```

`:exec` contains a hash of commands that are to be executed in order to
gather the information used for determining if a test passes or fails.
The key is arbitary, but important, as it will be used to store the
output of the command in the [`:data`](#data) section of the leaf node.
Additionally, each key **must** be unique within any given leaf node.
However, it can be re-used in other leaf nodes.

As these will be being passed to the command line, appropriate escape
characters should be used.

:exclamation: Because hash key ordering was only added to ruby in
version 1.9, you should assume these commands will not necessarily run
in order with the current implementation.

##### `:data`

```ruby
    :data   => Hash.new,
```

`:data` contains the `STDOUT` of the [`:exec`](#exec) commands. Whatever
key was used in the [`:exec`](#exec) hash will be re-used here to tie
the output to the command that created it. This data can also be
referenced by the [`:test`](#test) code in this or any other leaf node
within this benchmark section (see [How the tests
work](#how-the-tests-work).

##### `:test`

```ruby
    :test   => Proc.new {
                 this   = @@results['2']['2']['1']['3']
                 parent = @@results['2']['2']['1']['1']
                 if ( parent[:data]['rpm_chrony'] == 'package chrony is not installed' ) then
                   this[:result] = :skip
                 else
                   if ( this[:data]['grep1'] !~ /server\s+\S+/ ||
                        this[:data]['grep2'] !~ /OPTIONS="-u chrony"/ ) then
                     this[:result] = :fail
                   else
                     this[:result] = :pass
                   end
                 end
               },

```

`:test` is a ruby `Proc` that will be executed to set
[`:result`](#result). It can reference any part of the rest of the DSL
for any leaf node within this benchmark section (as shown in this
example where it references a _parent_ test for data).

This `Proc` **must** set [`:result`](#result) to one of the following:

* `:pass` : The test passed successfully.
* `:fail` : The test failed.
* `:skip` : The test was skipped due to dependencies or not being able
  to programmatically execute the test.

#### How the tests work

In order for the tests to work, they need to be instantiated by a class
that has already loaded the `Facter` library. In general, this is the
single `facter` fact discussed previously. It contains some code similar
to the following:

```ruby
require 'CIS_1_CentOS7'
require 'CIS_2_CentOS7'
require 'CIS_3_CentOS7'
require 'CIS_4_CentOS7'
require 'CIS_5_CentOS7'
require 'CIS_6_CentOS7'

Facter.add(:cis_centos7, :type => :aggregate) do
  confine :operatingsystem => 'CentOS'
  confine :operatingsystemmajrelease => '7'

  # Initialize test results
  cis_1 = CIS_1_CentOS7.new
  cis_2 = CIS_2_CentOS7.new
  cis_3 = CIS_3_CentOS7.new
  cis_4 = CIS_4_CentOS7.new
  cis_5 = CIS_5_CentOS7.new
  cis_6 = CIS_6_CentOS7.new

  ########################################
  # Show only test result
  #
  results_1 = CIS_1_CentOS7.facter_result_hash
  results_2 = CIS_2_CentOS7.facter_result_hash
  results_3 = CIS_3_CentOS7.facter_result_hash
  results_4 = CIS_4_CentOS7.facter_result_hash
  results_5 = CIS_5_CentOS7.facter_result_hash
  results_6 = CIS_6_CentOS7.facter_result_hash

  # All set here, let's let Facter have it
  chunk(:one) do
    results_1
  end
  chunk(:two) do
    results_2
  end
  chunk(:three) do
    results_3
  end
  chunk(:four) do
    results_4
  end
  chunk(:five) do
    results_5
  end
  chunk(:six) do
    results_6
  end

end

```

Getting test results consists of two parts:

##### Initializing the tests

```ruby
  cis_1 = CIS_1_CentOS7.new
  cis_2 = CIS_2_CentOS7.new
  cis_3 = CIS_3_CentOS7.new
  cis_4 = CIS_4_CentOS7.new
  cis_5 = CIS_5_CentOS7.new
  cis_6 = CIS_6_CentOS7.new
```

In this stage, the DSL is parsed and all [`:exec`](#exec) commands are
called, storing their resulting `STDOUT` in [`:data`](#data).

##### Running the tests

```ruby
  results_1 = CIS_1_CentOS7.facter_result_hash
  results_2 = CIS_2_CentOS7.facter_result_hash
  results_3 = CIS_3_CentOS7.facter_result_hash
  results_4 = CIS_4_CentOS7.facter_result_hash
  results_5 = CIS_5_CentOS7.facter_result_hash
  results_6 = CIS_6_CentOS7.facter_result_hash
```

In this stage, the tests are actually run (i.e., the `Proc` defined in
[`:test`](#test)). The results are then
[filtered](#customizing-the-structred-facts) and transformed into a
format that `facter`'s `chunk` can consume.

##### Combining the result sets

Each benchmark section creates its own result set. These are combined
into a single structured fact using `facter`'s `chunk` function, as seen
in the example.

### Customizing the structured facts

Because people may want to only return certain parts of the the DSL as
structured facts, the results can be filtered. This is done during the
[test run](#running-the-tests). Each class has several methods for
returning `facter`-consumable data:

| Method               | DSL Elements Returned                                       |
| :------------------- | :---------------------------------------------------------- |
| `facter_full_hash`   | `:title`, `:scored`, `:level`, `:result`, `:exec` & `:data` |
| `facter_result_hash` | `:result`                                                   |
| `facter_hash`        | customizable                                                |

Both `facter_full_hash` and `facter_result_hash` are called without
arguments. However, `facter_hash` requires one to provide an array of
the DSL elements that are to be returned The following example is
requesting only the `:title`, `:level`, `:result` and `:exec` elements
be returned:

```ruby
  keys = [ :title, :level, :result, :exec ]
  results_1 = CIS_1_CentOS7.facter_hash(keys)
  results_2 = CIS_2_CentOS7.facter_hash(keys)
  results_3 = CIS_3_CentOS7.facter_hash(keys)
  results_4 = CIS_4_CentOS7.facter_hash(keys)
  results_5 = CIS_5_CentOS7.facter_hash(keys)
  results_6 = CIS_6_CentOS7.facter_hash(keys)
```

Whatever is returned will be propogated as part of the structured fact.


### Converting the PDFs

This project provides a script that will take a CIS Benchmark PDF and
convert it into framework external classes. These are called _framework_
because, while the script is able to generate a great deal of what is
needed, it isn't able to fully generate the [`:test`](#test) part of the
leaf node.

:exclamation: The user **must** update the [`:test`](#test) part of the
leaf node with the test logic. Until that occurs, **all** generated
tests will return `:pass` regardless of the state of the system.

## `facts.d`-based facts

Some audit commands are just too heavy to execute on every run (think of
ones that do a find down the whole filesystem) and those are implemented
by cron jobs that write their results to `facts.d`.

# Getting started

To distribute these facts to nodes, simply install the module on your
Puppet master.  On your next run, all of the facts will get synced down
to all agents and they'll start to show up, even if you do not classify
nodes with a cis class.  You only need to include classes to get the
cron `facts.d`-based facts.

## Mcollective Ad-Hoc Queries

Let's add some example mco queries that will let someone easily get
basic info on their environment.

## PuppetDB Ad-Hoc Queries

Let's add some example curls to get folks started.


# Future discussion

* How do you exclude a fact from causing failure of a section of the
  guidelines.  For instance, what if the customer doesn't care if /tmp
is a separate partition?
  * Let the admin (or Puppet code from e.g. a profile class) drop a fact
    into `facts.d` such as "excludechecks=3.1,3.2,3.6" perhaps?
  * Some clever query to an external database?
* Before getting too far down the road, these should be implemented as
  structured facts.
