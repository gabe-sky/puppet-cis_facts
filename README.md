# Overview

This is a custom fact, for Facter, which is part of Puppet.  This is a simple proof-of-concept, to show how you might approach the task of using Puppet to ensure that systems are compliant with various CIS benchmarks.  It's meant to get you started thinking about how you'd do it at your own site.

Currently, it only checks the guidelines in CIS 2.0.1 for CentOS Linux 7.  Facter won't even try to run it on anything else.  (Which means it's safe to let pluginsync hand it to all your nodes, regardless of OS.)

If you'd like a copy of the CIS benchmarks, they're available at the CIS website:

  https://benchmarks.cisecurity.org/downloads/latest/


# This Is a Conversation Starter, Not a "Project"

Invariably, when I describe or demo this thing, someone says "oh yeah and you could also ..." and they start talking about all sorts of extra features.  Yes!  But that's not the point of this particular exercise.

The point of this code is to get people started thinking about one very simple approach to auditing security.  Your own implementation is your own business.  This is just a conversation starter with some code.


# Implementation

Most individual guidelines are checked by using Facter::Core::Execution.exec() to run the exact command listed in the "audit" section of the benchmark document.  Based on the result, they populate a hash that reflects compliance with each particular benchmark.  The result is a humongous (but easily machine parsable) structured fact that details everything about the node's compliance status.

Once this fact has been pluginsync'd down to a node, you can see the whole enormous structured fact from the command line of that node:

```shellsession
facter -p cis_centos7
```

And for a simple example, here's what you get if you index deeper into the whole fact to look at just one benchmark:

```shellsession
facter -p cis_centos7.1.2
```

```
{
  3 => {
    title => "Ensure gpgcheck is globally activated",
    scored => true,
    level => {
      server => "1",
      workstation => "1"
    },
    result => "pass"
  }
}
```

We invoked facter and told it to show the 1.2 section of the cis_centos7 fact.  Within 1.2, there is only one fact implemented, number 3.  The "title" key reflects what the CIS benchmark calls this benchmark in text.  There's a key indicating whether this benchmark is "scored" or not.  And two keys indicate what "level" this benchmark is, for servers or workstations.  The "result" field simply tells you if the system you ran facter on is in compliance.

It's up to you to decide what to do with the data.  It's my assumption that you're going to craft something like an MCollective inventory script, or make some clever PuppetDB queries, or maybe create node groups in the Puppet Enterprise Console that at-a-glance show you machines that match certain criteria.  The fact gives you everything, and it's up to you to filter out what you consider to be noise.


# Getting started

## Test on One System

If you just want to see it run, grab any old CentOS 7 system that has a Puppet agent on it and drop the contents of lib/facter into your agent's factpath.

* Disable your agent, so pluginsync won't remove this file randomly.
** `puppet agent --disable 'Messing with facter'`
* Determine where the agent is looking for facts.
** `puppet agent --configprint factpath`
* Copy all the files in this repository's lib/facter directory into that machine's factpath.
* Run facter and see what happens.
** `facter -p cis_centos7`
* Re-enable the agent when you're done.  (Its next run will delete this fact!)
** `puppet agent --enable`

## Actually Deploy It from the Master

You can install the contents of this repository as a Puppet module.  When agents connect to the master, during their pluginsync phase, they'll automatically download the new fact code.  When facter kicks off, CentOS 7 machines will use the fact.  After the run, the agent will report back to the master, and its facts will probably stashed in PuppetDB or sometimes just onto disk on the master.
