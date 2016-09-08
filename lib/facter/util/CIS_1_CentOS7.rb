class CIS_1_CentOS7

#  require 'Facter'

  # @@results data members
  :title  # Human-readable name of the test
  :scored # Boolean of whether or not the test is scored
  :level  # Hash specifying the level for each system type
  :result # Overall result of the test
  :exec   # Hash of commands to execute and store result
  :data   # Hash of values genereted by :exec array
  :test   # Proc to run the test

  # @@results[...]{:level} data members
  :server      # Key for indicating the test level for a server
  :workstation # Key for indicating the test level for a workstation

  # Valid :result values
  :pass   # Test passed
  :fail   # Test failed
  :nodata # Test has not yet been run
  :skip   # Test was skipped due to unfulfilled dependency

  # We'll build up this hash with all of the results, for a structured fact
  @@results = Hash.new

  # 1. Initial Setup
  @@results['1'] = Hash.new

  # 1.1 Filesystem Configuration
  @@results['1']['1'] = Hash.new

  # 1.1.1 Disable unused filesystems
  @@results['1']['1']['1'] = Hash.new

  # 1.1.1.1 Ensure mounting of cramfs filesystems is disabled (Scored)
  @@results['1']['1']['1']['1'] = {
    :title  => "Ensure mounting of cramfs filesystems is disabled",
    :scored => true,
    :level  => {
                 :server      => '1',
                 :workstation => '1',
               },
    :result => :nodata,
    :exec   => {
                 'modprobe' => '/usr/sbin/modprobe -n -v cramfs',
                 'lsmod'    => '/usr/sbin/lsmod | /usr/bin/grep "cramfs"',
               },
    :data   => Hash.new,
    :test   => Proc.new {
                 this = @@results['1']['1']['1']['1']
                 if ( this[:data]['modprobe'] != 'install /bin/true' ||
                      this[:data]['lsmod']    != '' ) then
                   this[:result] = :fail
                 else
                   this[:result] = :pass
                 end
               },
  }

  # 1.1.1.2 Ensure mounting of freevxfs filesystems is disabled (Scored)
  @@results['1']['1']['1']['2'] = {
    :title  => "Ensure mounting of freevxfs filesystems is disabled",
    :scored => true,
    :level  => {
                 :server      => '1',
                 :workstation => '1',
               },
    :result => :nodata,
    :exec   => {
                 'modprobe' => '/usr/sbin/modprobe -n -v freevxfs',
                 'lsmod'    => '/usr/sbin/lsmod | /usr/bin/grep "freevxfs"',
               },
    :data   => Hash.new,
    :test   => Proc.new {
                 this = @@results['1']['1']['1']['2']
                 if ( this[:data]['modprobe'] != "install /bin/true" ||
                      this[:data]['lsmod']    != '' ) then
                   this[:result] = :fail
                 else
                   this[:result] = :pass
                 end
               },
  }

  # 1.1.1.3 Ensure mounting of jffs2 filesystems is disabled (Scored)
  @@results['1']['1']['1']['3'] = {
    :title  => "Ensure mounting of jffs2 filesystems is disabled",
    :scored => true,
    :level  => {
                 :server      => '1',
                 :workstation => '1',
               },
    :result => :nodata,
    :exec   => {
                 'modprobe' => '/usr/sbin/modprobe -n -v jffs2',
                 'lsmod'    => '/usr/sbin/lsmod | /usr/bin/grep "jffs2"',
               },
    :data   => Hash.new,
    :test   => Proc.new {
                 this = @@results['1']['1']['1']['3']
                 if ( this[:data]['modprobe'] != "install /bin/true" ||
                      this[:data]['lsmod']    != '' ) then
                   this[:result] = :fail
                 else
                   this[:result] = :pass
                 end
               },
  }

  # 1.1.1.4 Ensure mounting of hfs filesystems is disabled (Scored)
  @@results['1']['1']['1']['4'] = {
    :title  => "Ensure mounting of hfs filesystems is disabled",
    :scored => true,
    :level  => {
                 :server      => '1',
                 :workstation => '1',
               },
    :result => :nodata,
    :exec   => {
                 'modprobe' => '/usr/sbin/modprobe -n -v hfs',
                 'lsmod'    => '/usr/sbin/lsmod | /usr/bin/grep "hfs"',
               },
    :data   => Hash.new,
    :test   => Proc.new {
                 this = @@results['1']['1']['1']['4']
                 if ( this[:data]['modprobe'] != "install /bin/true" ||
                      this[:data]['lsmod']    != '' ) then
                   this[:result] = :fail
                 else
                   this[:result] = :pass
                 end
               },
  }

  # 1.1.1.5 Ensure mounting of hfsplus filesystems is disabled (Scored)
  @@results['1']['1']['1']['5'] = {
    :title  => "Ensure mounting of hfsplus filesystems is disabled",
    :scored => true,
    :level  => {
                 :server      => '1',
                 :workstation => '1',
               },
    :result => :nodata,
    :exec   => {
                 'modprobe' => '/usr/sbin/modprobe -n -v hfsplus',
                 'lsmod'    => '/usr/sbin/lsmod | /usr/bin/grep "hfsplus"',
               },
    :data   => Hash.new,
    :test   => Proc.new {
                 this = @@results['1']['1']['1']['5']
                 if ( this[:data]['modprobe'] != "install /bin/true" ||
                      this[:data]['lsmod']    != '' ) then
                   this[:result] = :fail
                 else
                   this[:result] = :pass
                 end
               },
  }

  # 1.1.1.6 Ensure mounting of squashfs filesystems is disabled (Scored)
  @@results['1']['1']['1']['6'] = {
    :title  => "Ensure mounting of squashfs filesystems is disabled",
    :scored => true,
    :level  => {
                 :server      => '1',
                 :workstation => '1',
               },
    :result => :nodata,
    :exec   => {
                 'modprobe' => '/usr/sbin/modprobe -n -v squashfs',
                 'lsmod'    => '/usr/sbin/lsmod | /usr/bin/grep "squashfs"',
               },
    :data   => Hash.new,
    :test   => Proc.new {
                 this = @@results['1']['1']['1']['6']
                 if ( this[:data]['modprobe'] != "install /bin/true" ||
                      this[:data]['lsmod']    != '' ) then
                   this[:result] = :fail
                 else
                   this[:result] = :pass
                 end
               },
  }

  # 1.1.1.7 Ensure mounting of udf filesystems is disabled (Scored)
  @@results['1']['1']['1']['7'] = {
    :title  => "Ensure mounting of udf filesystems is disabled",
    :scored => true,
    :level  => {
                 :server      => '1',
                 :workstation => '1',
               },
    :result => :nodata,
    :exec   => {
                 'modprobe' => '/usr/sbin/modprobe -n -v udf',
                 'lsmod'    => '/usr/sbin/lsmod | /usr/bin/grep "udf"',
               },
    :data   => Hash.new,
    :test   => Proc.new {
                 this = @@results['1']['1']['1']['7']
                 if ( this[:data]['modprobe'] != "install /bin/true" ||
                      this[:data]['lsmod']    != '' ) then
                   this[:result] = :fail
                 else
                   this[:result] = :pass
                 end
               },
  }

  # 1.1.1.8 Ensure mounting of FAT filesystems is disabled (Scored)
  @@results['1']['1']['1']['8'] = {
    :title  => "Ensure mounting of FAT filesystems is disabled",
    :scored => true,
    :level  => {
                 :server      => '1',
                 :workstation => '2',
               },
    :result => :nodata,
    :exec   => {
                 'modprobe' => '/usr/sbin/modprobe -n -v vfat',
                 'lsmod'    => '/usr/sbin/lsmod | /usr/bin/grep "vfat"',
               },
    :data   => Hash.new,
    :test   => Proc.new {
                 this = @@results['1']['1']['1']['8']
                 if ( this[:data]['modprobe'] != "install /bin/true" ||
                      this[:data]['lsmod']    != '' ) then
                   this[:result] = :fail
                 else
                   this[:result] = :pass
                 end
               },
  }

  # 1.1.2 Ensure separate partition exists for /tmp (Scored)
  @@results['1']['1']['2'] = {
    :title  => "Ensure separate partition exists for /tmp",
    :scored => true,
    :level  => {
                 :server      => '2',
                 :workstation => '2',
               },
    :result => :nodata,
    :exec   => {
                 'mount' => '/usr/bin/mount | grep /tmp',
               },
    :data   => Hash.new,
    :test   => Proc.new {
                 this = @@results['1']['1']['2']
                 if ( this[:data]['mount'] !~ / on \/tmp type / ) then
                   this[:result] = :fail
                 else
                   this[:result] = :pass
                 end
               },
  }

  # 1.1.3 Ensure nodev option set on /tmp partition (Scored)
  # (Only if /tmp is its own partition.)
  @@results['1']['1']['3'] = {
    :title  => "Ensure nodev option set on /tmp partition",
    :scored => true,
    :level  => {
                 :server      => '1',
                 :workstation => '1',
               },
    :result => :nodata,
    :exec   => Hash.new,
    :data   => Hash.new,
    :test   => Proc.new {
                 this   = @@results['1']['1']['3']
                 parent = @@results['1']['1']['2']
                 if ( parent[:result] == :pass ) then
                   # Reusing mount from 1.1.2
                   if ( parent[:data]['mount'] !~ /nodev/ ) then
                     this[:result] = :fail
                   else
                     this[:result] = :pass
                   end
                 else
                   this[:result] = :skip
                 end
               },
  }

  # 1.1.4 Ensure nosuid option set on /tmp partition (Scored)
  # (Only if /tmp is its own partition.)
  @@results['1']['1']['4'] = {
    :title  => "Ensure nosuid option set on /tmp partition",
    :scored => true,
    :level  => {
                 :server      => '1',
                 :workstation => '1',
               },
    :result => :nodata,
    :exec   => Hash.new,
    :data   => Hash.new,
    :test   => Proc.new {
                 this   = @@results['1']['1']['4']
                 parent = @@results['1']['1']['2']
                 if ( parent[:result] == :pass ) then
                   # Reusing mount from 1.1.2
                   if ( parent[:data]['mount'] !~ /nosuid/ ) then
                     this[:result] = :fail
                   else
                     this[:result] = :pass
                   end
                 else
                   this[:result] = :skip
                 end
               },
  }

  # 1.1.5 Ensure noexec option set on /tmp partition (Scored)
  # (Only if /tmp is its own partition.)
  @@results['1']['1']['5'] = {
    :title  => "Ensure noexec option set on /tmp partition",
    :scored => true,
    :level  => {
                 :server      => '1',
                 :workstation => '1',
               },
    :result => :nodata,
    :exec   => Hash.new,
    :data   => Hash.new,
    :test   => Proc.new {
                 this   = @@results['1']['1']['5']
                 parent = @@results['1']['1']['2']
                 if ( parent[:result] == :pass ) then
                   # Reusing mount from 1.1.2
                   if ( parent[:data]['mount'] !~ /noexec/ ) then
                     this[:result] = :fail
                   else
                     this[:result] = :pass
                   end
                 else
                   this[:result] = :skip
                 end
               },
  }

  # 1.1.6 Ensure separate partition exists for /var (Scored)
  @@results['1']['1']['6'] = {
    :title  => "Ensure separate partition exists for /var",
    :scored => true,
    :level  => {
                 :server      => '2',
                 :workstation => '2',
               },
    :result => :nodata,
    :exec   => {
                 'mount' => '/usr/bin/mount | grep /var',
               },
    :data   => Hash.new,
    :test   => Proc.new {
                 this = @@results['1']['1']['6']
                 if ( this[:data]['mount'] !~ / on \/var type / ) then
                   this[:result] = :fail
                 else
                   this[:result] = :pass
                 end
               },
  }

  # 1.1.7 Ensure separate partition exists for /var/tmp (Scored)
  @@results['1']['1']['7'] = {
    :title  => "Ensure separate partition exists for /var/tmp",
    :scored => true,
    :level  => {
                 :server      => '2',
                 :workstation => '2',
               },
    :result => :nodata,
    :exec   => {
                 'mount' => '/usr/bin/mount | grep /var/tmp',
               },
    :data   => Hash.new,
    :test   => Proc.new {
                 this = @@results['1']['1']['7']
                 if ( this[:data]['mount'] !~ / on \/var\/tmp type / ) then
                   this[:result] = :fail
                 else
                   this[:result] = :pass
                 end
               },
  }

  # 1.1.8 Ensure nodev option set on /var/tmp partition (Scored)
  # (Only if /var/tmp is its own partition.)
  @@results['1']['1']['8'] = {
    :title  => "Ensure nodev option set on /var/tmp partition",
    :scored => true,
    :level  => {
                 :server      => '1',
                 :workstation => '1',
               },
    :result => :nodata,
    :exec   => Hash.new,
    :data   => Hash.new,
    :test   => Proc.new {
                 this   = @@results['1']['1']['8']
                 parent = @@results['1']['1']['7']
                 if ( parent[:result] == :pass ) then
                   # Reusing mount from 1.1.7
                   if ( parent[:data]['mount'] !~ /nodev/ ) then
                     this[:result] = :fail
                   else
                     this[:result] = :pass
                   end
                 else
                   this[:this] = :skip
                 end
               },
  }

  # 1.1.9 Ensure nosuid option set on /var/tmp partition (Scored)
  # (Only if /var/tmp is its own partition.)
  @@results['1']['1']['9'] = {
    :title  => "Ensure nosuid option set on /var/tmp partition",
    :scored => true,
    :level  => {
                 :server      => '1',
                 :workstation => '1',
               },
    :result => :nodata,
    :exec   => Hash.new,
    :data   => Hash.new,
    :test   => Proc.new {
                 this   = @@results['1']['1']['9']
                 parent = @@results['1']['1']['7']
                 if ( parent[:result] == :pass ) then
                   # Reusing mount from 1.1.7
                   if ( parent[:data]['mount'] !~ /nosuid/ ) then
                     this[:result] = :fail
                   else
                     this[:result] = :pass
                   end
                 else
                   this[:this] = :skip
                 end
               },
  }

  # 1.1.10 Ensure noexec option set on /var/tmp partition (Scored)
  # (Only if /var/tmp is its own partition.)
  @@results['1']['1']['10'] = {
    :title  => "Ensure noexec option set on /var/tmp partition",
    :scored => true,
    :level  => {
                 :server      => '1',
                 :workstation => '1',
               },
    :result => :nodata,
    :exec   => Hash.new,
    :data   => Hash.new,
    :test   => Proc.new {
                 this   = @@results['1']['1']['10']
                 parent = @@results['1']['1']['7']
                 if ( parent[:result] == :pass ) then
                   # Reusing mount from 1.1.7
                   if ( parent[:data]['mount'] !~ /noexec/ ) then
                     this[:result] = :fail
                   else
                     this[:result] = :pass
                   end
                 else
                   this[:this] = :skip
                 end
               },
  }

  # 1.1.11 Ensure separate partition exists for /var/log (Scored)
  @@results['1']['1']['11'] = {
    :title  => "Ensure separate partition exists for /var/log",
    :scored => true,
    :level  => {
                 :server      => '2',
                 :workstation => '2',
               },
    :result => :nodata,
    :exec   => {
                 'mount' => '/usr/bin/mount | grep /var/log',
               },
    :data   => Hash.new,
    :test   => Proc.new {
                 this = @@results['1']['1']['11']
                 if ( this[:data]['mount'] !~ / on \/var\/log type / ) then
                   this[:result] = :fail
                 else
                   this[:result] = :pass
                 end
               },
  }

  # 1.1.12 Ensure separate partition exists for /var/log/audit (Scored)
  @@results['1']['1']['12'] = {
    :title  => "Ensure separate partition exists for /var/log/audit",
    :scored => true,
    :level  => {
                 :server      => '2',
                 :workstation => '2',
               },
    :result => :nodata,
    :exec   => {
                 'mount' => '/usr/bin/mount | grep /var/log/audit',
               },
    :data   => Hash.new,
    :test   => Proc.new {
                 this = @@results['1']['1']['12']
                 if ( this[:data]['mount'] !~ / on \/var\/log\/audit type / ) then
                   this[:result] = :fail
                 else
                   this[:result] = :pass
                 end
               },
  }

  # 1.1.13 Ensure separate partition exists for /home (Scored)
  @@results['1']['1']['13'] = {
    :title  => "Ensure separate partition exists for /home",
    :scored => true,
    :level  => {
                 :server      => '2',
                 :workstation => '2',
               },
    :result => :nodata,
    :exec   => {
                 'mount' => '/usr/bin/mount | grep /home',
               },
    :data   => Hash.new,
    :test   => Proc.new {
                 this = @@results['1']['1']['13']
                 if ( this[:data]['mount'] !~ / on \/home type / ) then
                   this[:result] = :fail
                 else
                   this[:result] = :pass
                 end
               },
  }

  # 1.1.14 Ensure nodev option set on /home partition (Scored)
  # (Only if /home is its own partition.)
  @@results['1']['1']['14'] = {
    :title  => "Ensure nodev option set on /home partition",
    :scored => true,
    :level  => {
                 :server      => '1',
                 :workstation => '1',
               },
    :result => :nodata,
    :exec   => Hash.new,
    :data   => Hash.new,
    :test   => Proc.new {
                 this   = @@results['1']['1']['14']
                 parent = @@results['1']['1']['13']
                 if ( parent[:result] == :pass ) then
                   # Reusing mount from 1.1.13
                   if ( parent[:data]['mount'] !~ /nodev/ ) then
                     this[:result] = :fail
                   else
                     this[:result] = :pass
                   end
                 else
                   this[:result] = :skip
                 end
               },
  }

  # 1.1.15 Ensure nodev option set on /dev/shm partition (Scored)
  @@results['1']['1']['15'] = {
    :title  => "Ensure nodev option set on /dev/shm partition",
    :scored => true,
    :level  => {
                 :server      => '1',
                 :workstation => '1',
               },
    :result => :nodata,
    :exec   => {
                 'mount' => '/usr/bin/mount | grep /dev/shm',
               },
    :data   => Hash.new,
    :test   => Proc.new {
                 this = @@results['1']['1']['15']
                 if ( this[:data]['mount'] !~ /nodev/ ) then
                   this[:result] = :fail
                 else
                   this[:result] = :pass
                 end
               },
  }

  # 1.1.16 Ensure nosuid option set on /dev/shm partition (Scored)
  @@results['1']['1']['16'] = {
    :title  => "Ensure nosuid option set on /dev/shm partition",
    :scored => true,
    :level  => {
                 :server      => '1',
                 :workstation => '1',
               },
    :result => :nodata,
    :exec   => {
                 'mount' => '/usr/bin/mount | grep /dev/shm',
               },
    :data   => Hash.new,
    :test   => Proc.new {
                 this = @@results['1']['1']['16']
                 if ( this[:data]['mount'] !~ /nosuid/ ) then
                   this[:result] = :fail
                 else
                   this[:result] = :pass
                 end
               },
  }

  # 1.1.17 Ensure noexec option set on /dev/shm partition (Scored)
  @@results['1']['1']['17'] = {
    :title  => "Ensure noexec option set on /dev/shm partition",
    :scored => true,
    :level  => {
                 :server      => '1',
                 :workstation => '1',
               },
    :result => :nodata,
    :exec   => {
                 'mount' => '/usr/bin/mount | grep /dev/shm',
               },
    :data   => Hash.new,
    :test   => Proc.new {
                 this = @@results['1']['1']['17']
                 if ( this[:data]['mount'] !~ /noexec/ ) then
                   this[:result] = :fail
                 else
                   this[:result] = :pass
                 end
               },
  }

  # 1.1.18 Ensure nodev option set on removable media partitions (Not Scored)
  # 1.1.19 Ensure nosuid option set on removable media partitions (Not Scored)
  # 1.1.20 Ensure noexec option set on removable media partitions (Not Scored)
  #
  # These three guidelines are not specific enough, and require human judge-
  # ment, in order to audit them.

  # 1.1.21 Ensure sticky bit is set on all world-writable directories (Scored)
  @@results['1']['1']['21'] = {
    :title  => "Ensure sticky bit is set on all world-writable directories",
    :scored => true,
    :level  => {
                 :server      => '1',
                 :workstation => '1',
               },
    :result => :nodata,
    :exec   => {
                 'unsticky' => 'df --local -P | awk {"if (NR!=1) print $6"} | xargs -I "{}" find "{}" -xdev -type d \( -perm -0002 -a ! -perm -1000 \) 2>/dev/null',
               },
    :data   => Hash.new,
    :test   => Proc.new {
                 this = @@results['1']['1']['21']
                 if ( this[:data]['unsticky'] != nil ) then
                   this[:result] = :fail
                 else
                   this[:result] = :pass
                 end
               },
  }

  # 1.1.22 Disable Automounting (Scored)
  @@results['1']['1']['22'] = {
    :title  => "Disable Automounting",
    :scored => true,
    :level  => {
                 :server      => '1',
                 :workstation => '2',
               },
    :result => :nodata,
    :exec   => {
                 'automount' => '/usr/bin/systemctl is-enabled autofs',
               },
    :data   => Hash.new,
    :test   => Proc.new {
                 this = @@results['1']['1']['22']
                 if ( this[:data]['automount'] == "enabled" ) then
                   this[:result] = :fail
                 else
                   this[:result] = :pass
                 end
               },
  }

  # 1.2 Configure Software Updates
  @@results['1']['2'] = Hash.new

  # 1.2.1 Ensure package manager repositories are configured (Not Scored)
  # 1.2.2 Ensure GPG keys are configured (Not Scored)
  #
  # These two guidelines are not specific enough, and require human judgement,
  # in order to audit them.

  # 1.2.3 Ensure gpgcheck is globally activated (Scored)
  @@results['1']['2']['3'] = {
    :title  => "Ensure gpgcheck is globally activated",
    :scored => true,
    :level  => {
                 :server      => '1',
                 :workstation => '1',
               },
    :result => :nodata,
    :exec   => {
                 'gpgcheck' => '/usr/bin/grep ^gpgcheck /etc/yum.conf',
               },
    :data   => Hash.new,
    :test   => Proc.new {
                 this = @@results['1']['2']['3']
                 if ( this[:data]['gpgcheck'] != "gpgcheck=1" ) then
                   this[:result] = :fail
                 else
                   this[:result] = :pass
                 end
               },
  }

  # 1.3 Filesystem Integrity Checking
  @@results['1']['3'] = Hash.new

  # 1.3.1 Ensure AIDE is installed (Scored)
  @@results['1']['3']['1'] = {
    :title  => "Ensure AIDE is installed",
    :scored => true,
    :level  => {
                 :server      => '1',
                 :workstation => '1',
               },
    :result => :nodata,
    :exec   => {
                 'rpm' => '/usr/bin/rpm -q aide',
               },
    :data   => Hash.new,
    :test   => Proc.new {
                 this = @@results['1']['3']['1']
                 if ( this[:data]['rpm'] !~ /^aide-/ ) then
                   this[:result] = :fail
                 else
                   this[:result] = :pass
                 end
               },
  }

  # 1.3.2 Ensure filesystem integrity is regularly checked (Scored)
  @@results['1']['3']['2'] = {
    :title  => "Ensure filesystem integrity is regularly checked",
    :scored => true,
    :level  => {
                 :server      => '1',
                 :workstation => '1',
               },
    :result => :nodata,
    :exec   => {
                 'crontab' => '/usr/bin/crontab -u root -l | grep -c aide',
                 'crond'   => '/usr/bin/grep -r aide /etc/cron.* /etc/crontab | /usr/bin/wc -l',
               },
    :data   => Hash.new,
    :test   => Proc.new {
                 this = @@results['1']['3']['2']
                 if ( this[:data]['crontab'] == "0" &&
                      this[:data]['crond'  ] == "0" ) then
                   this[:result] = :fail
                 else
                   this[:result] = :pass
                 end
               },
  }


  def initialize
    populate_all_data(@@results)
    run_tests(@@results)
  end

  public
  def self.facter_full_hash()
    keys = [:title, :scored, :level, :result, :exec, :data]
    self.facter_hash(keys)
  end

  public
  def self.facter_result_hash()
    keys = [:result]
    self.facter_hash(keys)
  end

  public
  def self.facter_hash(include_array)
    raise 'facter_hash requires an array of symbols' unless include_array.instance_of? Array
    result = Hash.new
    self.hash_deep_copy!(@@results, result, include_array)
    result
  end

  private
  def self.hash_deep_copy!(src,dst,include_array)
    src.each do
      |key, value|
      case key
      when :title
        dst[key.to_s] = value if include_array.include? :title
      when :scored
        dst[key.to_s] = value if include_array.include? :scored
      when :level
        if (include_array.include? :level) then
          dst[key.to_s] = Hash.new
          dst[key.to_s][:server.to_s]      = value[:server]
          dst[key.to_s][:workstation.to_s] = value[:workstation]
        end
      when :result
        dst[key.to_s] = value if include_array.include? :result
      when :exec
        if (include_array.include? :exec) then
          dst[key.to_s] = Hash.new
          value.each do
            |variable, cmd|
            dst[key.to_s][variable.to_s] = cmd
          end
        end
      when :data
        if (include_array.include? :data) then
          dst[key.to_s] = Hash.new
          value.each do
            |variable, cmd_value|
            dst[key.to_s][variable.to_s] = cmd_value
          end
        end
      else
        if ( value.instance_of? Hash ) then
          dst[key.to_s] = Hash.new
          hash_deep_copy!(value, dst[key.to_s], include_array)
        end
      end
    end
  end

  private
  def execute_command(cmd)
    Facter::Core::Execution.exec(cmd)
  end

  private
  def populate_data(exec_hash, data_hash)
    exec_hash.each do
      |key, cmd|
      data_hash[key] = execute_command(cmd)
    end
  end

  private
  def populate_all_data(hash)
    return unless hash.instance_of? Hash
    hash.sort.each do
      |key, element|
      if (element.instance_of? Hash) then
        populate_all_data(element)
      end
    end
    if ( hash.has_key?(:exec) ) then
      if ( hash.has_key?(:data) ) then
        populate_data(hash[:exec], hash[:data])
      else
        raise "Malformed hash: missing :data section"
      end
    end
  end

  private
  def run_tests(hash)
    return unless hash.instance_of? Hash
    hash.sort.each do
      |key, element|
      if (element.instance_of? Hash) then
        run_tests(element)
      end
    end
    if ( hash.has_key?(:test) ) then
      hash[:test].call
    end
  end


end
