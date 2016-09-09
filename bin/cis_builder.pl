#!/usr/bin/perl -w

use strict;
use warnings;
use Getopt::Long;

use constant EXEC   => ':exec';
use constant EXPECT => '--EXPECT--';
use constant LEVEL  => ':level';
use constant SCORED => ':scored';
use constant TITLE  => ':title';
use constant VALID  => '--VALID--';

our %Tests   = ();
our $Text    = undef;
our $OpSys   = undef;
our $Verbose = 0;

#===============================================================================
#
MAIN:
{
  &_init;
  &parse_pdf;
  foreach my $section (keys %Tests)
  {
    &create_framework($section);
  }
}
#
#===============================================================================


#-------------------------------------------------------------------------------
#
sub _init #()#
{

  my ($pdf, $show_usage);
  GetOptions ( 'pdf=s' => \$pdf,        # Input PDF
               'p=s'   => \$pdf,        # Input PDF (alternative)
               'os=s'  => \$OpSys,      # Operating System
               'o=s'   => \$OpSys,      # Operating System (alternative)
               'v'     => \$Verbose,    # Verbose Mode
               'help'  => \$show_usage, # Show Usage
               'h'     => \$show_usage, # Show Usage (alternative)
  ) or $show_usage = 1;

  &usage if $show_usage;

  &usage('Missing input PDF filename') unless $pdf;
  &usage('Invalid input PDF filename') unless $pdf =~ /\.pdf$/i;
  &usage('Missing operating system')   unless $OpSys;

  $Text =  `pdftotext -eol unix $pdf -`;
  $Text =~ s/\d+ \| P a g e\s+//gm;

  return;

}
#
#-------------------------------------------------------------------------------
#
sub usage #(;$)#
{

  my $message = $_[0] || undef;

  my $exe =  $0;
     $exe =~ s/^.+\/(.+)$/$1/;

  print "Usage: $exe [--pdf|-p <PDF> --os|-o <OPERATING_SYSTEM> [-v]] | [--help|-h]\n\n"
      . " --pdf  | -p   Filename of the PDF to parse\n"
      . " --os   | -o   Operating system name to use (no spaces allowed)\n"
      . "          -v   Verbose mode\n"
      . " --help | -h   Help -- show this message\n\n";

  if ($message)
  {
    print "ERROR: $message\n\n";
    exit 255;
  }

  exit;

}
#
#-------------------------------------------------------------------------------
#
sub parse_pdf #()#
{

  my $test_name    = undef;
  my $current_test = undef;
  my $active       = 0;
  my @test_ids     = ();
  my %unit         = ();
  my $audit        = 0;
  my $skip_line    = 0;
  my $variable     = undef;

  LINE: foreach my $line (split /\n+/, $Text)
  {

    # Skip line, if requested
    if ($skip_line)
    {
      if ($line =~ /^#/)
      {
        $skip_line = 0;
      }
      else
      {
        next LINE;
      }
    }

    # Skip the table of contents
    if (not $active)
    {
      if ($line =~ /^Appendix: Change History/)
      {
        $active = 1;
      }
      next LINE;
    }

    # Add unit, if valid
    if (exists $unit{&VALID})
    {
      delete $unit{&VALID};
      add_unit(\@test_ids, \%unit);
      $test_name = undef;
      %unit      = ();
    }

    # Look for a heading
    if ($line =~ /^([\d.]*\d+) (.+)$/)
    {
      @test_ids  = split /\./, $1;
      $test_name = $2;
      %unit          =  ();
      $unit{&SCORED} =  ($test_name =~ /\(Scored\)/)
                     ?  'true'
                     :  'false';
      $test_name     =~ s/^(.+)\(.+$/$1/;
      $test_name     =~ s/\s+$//g;
      $unit{&TITLE}  =  $test_name;
      $audit         =  0;
      $variable      =  0;
      $skip_line     =  0;
    }
    else
    {
      next LINE unless defined $test_name;
      if ($line =~ /Level (\d) - ([a-z]+)/i)
      {
        my $level = $1;
        my $type  = lc $2;
        $unit{&LEVEL}{":$type"} = $level;
      }
      elsif ($line =~ /^Audit:/)
      {
        $audit     = 1;
        $skip_line = 1;
      }
      elsif ($line =~ /^Remediation:/)
      {
        $audit        = 0;
        $unit{&VALID} = 1;
      }
      elsif ($audit)
      {
        if ($line =~ /^# (\S+)(.+)/)
        {
          my ($cmd, $params) = ($1, $2);
          my $key   = $cmd;
          my $count = 1;
          while (exists $unit{&EXEC}{$key}) {
            $count++;
            $key = $cmd . $count;
          }
          $unit{&EXEC}{$key} = $cmd . $params;
          $variable = $key;
        }
        else
        {
          $unit{&EXPECT}{$variable} = $line;
        }
      }
    }
  }

  return;

}
#
#-------------------------------------------------------------------------------
#
sub add_unit #(\@\%)#
{

  my @ids  = @{$_[0]};
  my %unit = %{$_[1]};
  my $href = \%Tests;

  foreach my $id (@ids)
  {
    $href = &get_child($href, $id);
  }
  foreach my $key (keys %unit)
  {
    $href->{$key} = $unit{$key};
  }

  return;

}
#
#-------------------------------------------------------------------------------
#
sub get_child #(\%$)#
{

  my $href  = $_[0];
  my $child = $_[1];

  $href->{$child} = {} unless exists $href->{$child};

  return $href->{$child};

}
#
#-------------------------------------------------------------------------------
#
sub create_framework #($)#
{

  my $section  = $_[0];
  my $filename = &get_class_name($section) . '.rb';
  my $fh       = undef;

  open $fh, ">$filename" or die "Cannot open '$filename' for write: $!";
  &write_header ( $fh, $section );
  &write_body   ( $fh, $section );
  &write_footer ( $fh           );
  close $fh;

  return;

}
#
#-------------------------------------------------------------------------------
#
sub write_header #(*$)#
{

  my $fh      = $_[0];
  my $section = $_[1];
  my $class   = &get_class_name($section);

  print $fh "class $class\n";
  my $header = join "\n",
               '',
               '  # @@results data members',
               '  :title  # Human-readable name of the test',
               '  :scored # Boolean of whether or not the test is scored',
               '  :level  # Hash specifying the level for each system type',
               '  :result # Overall result of the test',
               '  :exec   # Hash of commands to execute and store result',
               '  :data   # Hash of values genereted by :exec array',
               '  :test   # Proc to run the test',
               '',
               '  # @@results[...]{:level} data members',
               '  :server      # Key for indicating the test level for a server',
               '  :workstation # Key for indicating the test level for a workstation',
               '',
               '  # Valid :result values',
               '  :pass   # Test passed',
               '  :fail   # Test failed',
               '  :nodata # Test has not yet been run',
               '  :skip   # Test was skipped due to unfulfilled dependency',
               '',
               "  # We'll build up this hash with all of the results, for a structured fact",
               '  @@results = Hash.new',
               '';
  print $fh $header;

  return;

}
#
#-------------------------------------------------------------------------------
#
sub write_body #(*$)#
{

  my $fh      = $_[0];
  my $section = $_[1];

  my @parents = ($section);
  &traverse_tree($fh, $Tests{$section}, \@parents);

  return;

}
#
#-------------------------------------------------------------------------------
#
sub traverse_tree #(*\%\@)#
{

  my $fh      =   $_[0];
  my $tree    =   $_[1];
  my @parents = @{$_[2]};

  if (exists $tree->{&TITLE})
  {
    # Leaf Node
    printf $fh "  # %s %s (%s)\n",
               join('.', @parents),
               $tree->{&TITLE},
               ($tree->{&SCORED} eq 'true') ? 'Scored' : 'Not Scored';
    printf $fh "  \@\@results['%s'] = {\n",
               join("']['", @parents);
    my $title =  $tree->{&TITLE};
       $title =~ s/"/\\"/g;
    print  $fh "    :title  => \"$title\",\n";
    printf $fh "    :scored => %s,\n",
               $tree->{&SCORED};
    print  $fh "    :level  => {\n";
    printf $fh "                 :server      => '%d',\n",
               $tree->{&LEVEL}{':server'};
    printf $fh "                 :workstation => '%d',\n",
               $tree->{&LEVEL}{':workstation'};
    print  $fh "               },\n"
             . "    :result => :nodata,\n"
             . "    :exec   => {\n";
    foreach my $variable (keys %{$tree->{&EXEC}})
    {
      my $cmd =  $tree->{&EXEC}{$variable};
         $cmd =~ s/"/\\"/g;
      printf $fh "                 '%s' => \"%s\",\n",
                 $variable,
                 $cmd;
    }
    print  $fh "               },\n"
             . "    :data   => Hash.new,\n"
             . "    :test   => Proc.new {\n";
    printf $fh "                 this = \@\@results['%s']\n",
               join("']['", @parents);
    print  $fh "                 if (\n"
             . "# TODO Put failure case here. Expecting:\n";
    foreach my $variable (keys %{$tree->{&EXPECT}})
    {
      printf $fh "# %s => %s\n",
                 $variable,
                 $tree->{&EXPECT}{$variable};
    }
    print  $fh "                    ) then\n"
             . "                   this[:result] = :fail\n"
             . "                 else\n"
             . "                   this[:result] = :pass\n"
             . "                 end\n"
             . "               },\n"
             . "  }\n\n";
  }
  else
  {
    # Branch
    printf $fh "  # %s\n",
               join('.', @parents);
    printf $fh "  \@\@results['%s'] = Hash.new\n\n",
               join("']['", @parents);
    foreach my $child (sort { int($a) <=> int($b) } keys %{$tree})
    {
      my @new_parents = (@parents, $child);
      &traverse_tree($fh, $tree->{$child}, \@new_parents);
    }
  }

  return;

}
#
#-------------------------------------------------------------------------------
#
sub write_footer #(*)#
{

  my $fh = $_[0];

  my $footer = join "\n",
               '  def initialize',
               '    populate_all_data(@@results)',
               '    run_tests(@@results)',
               '  end',
               '',
               '  public',
               '  def self.facter_full_hash()',
               '    keys = [:title, :scored, :level, :result, :exec, :data]',
               '    self.facter_hash(keys)',
               '  end',
               '',
               '  public',
               '  def self.facter_result_hash()',
               '    keys = [:result]',
               '    self.facter_hash(keys)',
               '  end',
               '',
               '  public',
               '  def self.facter_hash(include_array)',
               "    raise 'facter_hash requires an array of symbols' unless include_array.instance_of? Array",
               '    result = Hash.new',
               '    self.hash_deep_copy!(@@results, result, include_array)',
               '    result',
               '  end',
               '',
               '  private',
               '  def self.hash_deep_copy!(src,dst,include_array)',
               '    src.each do',
               '      |key, value|',
               '      case key',
               '      when :title',
               '        dst[key.to_s] = value if include_array.include? :title',
               '      when :scored',
               '        dst[key.to_s] = value if include_array.include? :scored',
               '      when :level',
               '        if (include_array.include? :level) then',
               '          dst[key.to_s] = Hash.new',
               '          dst[key.to_s][:server.to_s]      = value[:server]',
               '          dst[key.to_s][:workstation.to_s] = value[:workstation]',
               '        end',
               '      when :result',
               '        dst[key.to_s] = value if include_array.include? :result',
               '      when :exec',
               '        if (include_array.include? :exec) then',
               '          dst[key.to_s] = Hash.new',
               '          value.each do',
               '            |variable, cmd|',
               '            dst[key.to_s][variable.to_s] = cmd',
               '          end',
               '        end',
               '      when :data',
               '        if (include_array.include? :data) then',
               '          dst[key.to_s] = Hash.new',
               '          value.each do',
               '            |variable, cmd_value|',
               '            dst[key.to_s][variable.to_s] = cmd_value',
               '          end',
               '        end',
               '      else',
               '        if ( value.instance_of? Hash ) then',
               '          dst[key.to_s] = Hash.new',
               '          hash_deep_copy!(value, dst[key.to_s], include_array)',
               '        end',
               '      end',
               '    end',
               '  end',
               '',
               '  private',
               '  def execute_command(cmd)',
               '    Facter::Core::Execution.exec(cmd)',
               '  end',
               '',
               '  private',
               '  def populate_data(exec_hash, data_hash)',
               '    exec_hash.each do',
               '      |key, cmd|',
               '      data_hash[key] = execute_command(cmd)',
               '    end',
               '  end',
               '',
               '  private',
               '  def populate_all_data(hash)',
               '    return unless hash.instance_of? Hash',
               '    hash.sort.each do',
               '      |key, element|',
               '      if (element.instance_of? Hash) then',
               '        populate_all_data(element)',
               '      end',
               '    end',
               '    if ( hash.has_key?(:exec) ) then',
               '      if ( hash.has_key?(:data) ) then',
               '        populate_data(hash[:exec], hash[:data])',
               '      else',
               '        raise "Malformed hash: missing :data section"',
               '      end',
               '    end',
               '  end',
               '',
               '  private',
               '  def run_tests(hash)',
               '    return unless hash.instance_of? Hash',
               '    hash.sort.each do',
               '      |key, element|',
               '      if (element.instance_of? Hash) then',
               '        run_tests(element)',
               '      end',
               '    end',
               '    if ( hash.has_key?(:test) ) then',
               '      hash[:test].call',
               '    end',
               '  end',
               '',
               '',
               'end';
  print $fh $footer;

  return;

}
#
#-------------------------------------------------------------------------------
#
sub get_class_name #($)#
{
  return join '_', 'CIS', $_[0], $OpSys;
}
#
#-------------------------------------------------------------------------------


__END__

