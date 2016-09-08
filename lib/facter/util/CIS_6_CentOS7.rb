class CIS_6_CentOS7

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
  # 6
  @@results['6'] = Hash.new

  # 6.1
  @@results['6']['1'] = Hash.new

  # 6.1.1 Audit system file permissions
  @@results['6']['1']['1'] = {
    :title  => "Audit system file permissions",
    :scored => false,
    :level  => {
                 :server      => '2',
                 :workstation => '2',
               },
    :result => :nodata,
    :exec   => {
                 'rpm' => "rpm -Va --nomtime --nosize --nomd5 --nolinkto > <filename>",
               },
    :data   => Hash.new,
    :test   => Proc.new {
                 this = @@results['6']['1']['1']
                 if (
# TODO Put failure case here. Expecting:
                    ) then
                   this[:result] = :fail
                 else
                   this[:result] = :pass
                 end
               },
  }

  # 6.1.2 Ensure permissions on /etc/passwd are configured
  @@results['6']['1']['2'] = {
    :title  => "Ensure permissions on /etc/passwd are configured",
    :scored => true,
    :level  => {
                 :server      => '1',
                 :workstation => '1',
               },
    :result => :nodata,
    :exec   => {
                 'stat' => "stat /etc/passwd",
               },
    :data   => Hash.new,
    :test   => Proc.new {
                 this = @@results['6']['1']['2']
                 if (
# TODO Put failure case here. Expecting:
# stat => root)
                    ) then
                   this[:result] = :fail
                 else
                   this[:result] = :pass
                 end
               },
  }

  # 6.1.3 Ensure permissions on /etc/shadow are configured
  @@results['6']['1']['3'] = {
    :title  => "Ensure permissions on /etc/shadow are configured",
    :scored => true,
    :level  => {
                 :server      => '1',
                 :workstation => '1',
               },
    :result => :nodata,
    :exec   => {
                 'stat' => "stat /etc/shadow",
               },
    :data   => Hash.new,
    :test   => Proc.new {
                 this = @@results['6']['1']['3']
                 if (
# TODO Put failure case here. Expecting:
# stat => root)
                    ) then
                   this[:result] = :fail
                 else
                   this[:result] = :pass
                 end
               },
  }

  # 6.1.4 Ensure permissions on /etc/group are configured
  @@results['6']['1']['4'] = {
    :title  => "Ensure permissions on /etc/group are configured",
    :scored => true,
    :level  => {
                 :server      => '1',
                 :workstation => '1',
               },
    :result => :nodata,
    :exec   => {
                 'stat' => "stat /etc/group",
               },
    :data   => Hash.new,
    :test   => Proc.new {
                 this = @@results['6']['1']['4']
                 if (
# TODO Put failure case here. Expecting:
# stat => root)
                    ) then
                   this[:result] = :fail
                 else
                   this[:result] = :pass
                 end
               },
  }

  # 6.1.5 Ensure permissions on /etc/gshadow are configured
  @@results['6']['1']['5'] = {
    :title  => "Ensure permissions on /etc/gshadow are configured",
    :scored => true,
    :level  => {
                 :server      => '1',
                 :workstation => '1',
               },
    :result => :nodata,
    :exec   => {
                 'stat' => "stat /etc/gshadow",
               },
    :data   => Hash.new,
    :test   => Proc.new {
                 this = @@results['6']['1']['5']
                 if (
# TODO Put failure case here. Expecting:
# stat => root)
                    ) then
                   this[:result] = :fail
                 else
                   this[:result] = :pass
                 end
               },
  }

  # 6.1.6 Ensure permissions on /etc/passwd- are configured
  @@results['6']['1']['6'] = {
    :title  => "Ensure permissions on /etc/passwd- are configured",
    :scored => true,
    :level  => {
                 :server      => '1',
                 :workstation => '1',
               },
    :result => :nodata,
    :exec   => {
                 'stat' => "stat /etc/passwdAccess: (0600/-rw-------)",
               },
    :data   => Hash.new,
    :test   => Proc.new {
                 this = @@results['6']['1']['6']
                 if (
# TODO Put failure case here. Expecting:
# stat => root)
                    ) then
                   this[:result] = :fail
                 else
                   this[:result] = :pass
                 end
               },
  }

  # 6.1.7 Ensure permissions on /etc/shadow- are configured
  @@results['6']['1']['7'] = {
    :title  => "Ensure permissions on /etc/shadow- are configured",
    :scored => true,
    :level  => {
                 :server      => '1',
                 :workstation => '1',
               },
    :result => :nodata,
    :exec   => {
                 'stat' => "stat /etc/shadowAccess: (0600/-rw-------)",
               },
    :data   => Hash.new,
    :test   => Proc.new {
                 this = @@results['6']['1']['7']
                 if (
# TODO Put failure case here. Expecting:
# stat => root)
                    ) then
                   this[:result] = :fail
                 else
                   this[:result] = :pass
                 end
               },
  }

  # 6.1.8 Ensure permissions on /etc/group- are configured
  @@results['6']['1']['8'] = {
    :title  => "Ensure permissions on /etc/group- are configured",
    :scored => true,
    :level  => {
                 :server      => '1',
                 :workstation => '1',
               },
    :result => :nodata,
    :exec   => {
                 'stat' => "stat /etc/groupAccess: (0600/-rw-------)",
               },
    :data   => Hash.new,
    :test   => Proc.new {
                 this = @@results['6']['1']['8']
                 if (
# TODO Put failure case here. Expecting:
# stat => root)
                    ) then
                   this[:result] = :fail
                 else
                   this[:result] = :pass
                 end
               },
  }

  # 6.1.9 Ensure permissions on /etc/gshadow- are configured
  @@results['6']['1']['9'] = {
    :title  => "Ensure permissions on /etc/gshadow- are configured",
    :scored => true,
    :level  => {
                 :server      => '1',
                 :workstation => '1',
               },
    :result => :nodata,
    :exec   => {
                 'stat' => "stat /etc/gshadowAccess: (0600/-rw-------)",
               },
    :data   => Hash.new,
    :test   => Proc.new {
                 this = @@results['6']['1']['9']
                 if (
# TODO Put failure case here. Expecting:
# stat => root)
                    ) then
                   this[:result] = :fail
                 else
                   this[:result] = :pass
                 end
               },
  }

  # 6.1.10 Ensure no world writable files exist
  @@results['6']['1']['10'] = {
    :title  => "Ensure no world writable files exist",
    :scored => true,
    :level  => {
                 :server      => '1',
                 :workstation => '1',
               },
    :result => :nodata,
    :exec   => {
                 'df' => "df --local -P | awk {'if (NR!=1) print $6'} | xargs -I '{}' find '{}' -xdev -type f",
                 'find' => "find <partition> -xdev -type f -perm -0002",
               },
    :data   => Hash.new,
    :test   => Proc.new {
                 this = @@results['6']['1']['10']
                 if (
# TODO Put failure case here. Expecting:
# df => mounted filesystems or the following command can be run manually for each partition:
                    ) then
                   this[:result] = :fail
                 else
                   this[:result] = :pass
                 end
               },
  }

  # 6.1.11 Ensure no unowned files or directories exist
  @@results['6']['1']['11'] = {
    :title  => "Ensure no unowned files or directories exist",
    :scored => true,
    :level  => {
                 :server      => '1',
                 :workstation => '1',
               },
    :result => :nodata,
    :exec   => {
                 'df' => "df --local -P | awk {'if (NR!=1) print $6'} | xargs -I '{}' find '{}' -xdev -nouser",
                 'find' => "find <partition> -xdev -nouser",
               },
    :data   => Hash.new,
    :test   => Proc.new {
                 this = @@results['6']['1']['11']
                 if (
# TODO Put failure case here. Expecting:
# df => mounted filesystems or the following command can be run manually for each partition:
                    ) then
                   this[:result] = :fail
                 else
                   this[:result] = :pass
                 end
               },
  }

  # 6.1.12 Ensure no ungrouped files or directories exist
  @@results['6']['1']['12'] = {
    :title  => "Ensure no ungrouped files or directories exist",
    :scored => true,
    :level  => {
                 :server      => '1',
                 :workstation => '1',
               },
    :result => :nodata,
    :exec   => {
                 'df' => "df --local -P | awk {'if (NR!=1) print $6'} | xargs -I '{}' find '{}' -xdev -nogroup",
                 'find' => "find <partition> -xdev -nogroup",
               },
    :data   => Hash.new,
    :test   => Proc.new {
                 this = @@results['6']['1']['12']
                 if (
# TODO Put failure case here. Expecting:
# df => mounted filesystems or the following command can be run manually for each partition:
                    ) then
                   this[:result] = :fail
                 else
                   this[:result] = :pass
                 end
               },
  }

  # 6.1.13 Audit SUID executables
  @@results['6']['1']['13'] = {
    :title  => "Audit SUID executables",
    :scored => false,
    :level  => {
                 :server      => '1',
                 :workstation => '1',
               },
    :result => :nodata,
    :exec   => {
                 'df' => "df --local -P | awk {'if (NR!=1) print $6'} | xargs -I '{}' find '{}' -xdev -type f",
                 'find' => "find <partition> -xdev -type f -perm -4000",
               },
    :data   => Hash.new,
    :test   => Proc.new {
                 this = @@results['6']['1']['13']
                 if (
# TODO Put failure case here. Expecting:
# df => mounted filesystems or the following command can be run manually for each partition:
                    ) then
                   this[:result] = :fail
                 else
                   this[:result] = :pass
                 end
               },
  }

  # 6.1.14 Audit SGID executables
  @@results['6']['1']['14'] = {
    :title  => "Audit SGID executables",
    :scored => false,
    :level  => {
                 :server      => '1',
                 :workstation => '1',
               },
    :result => :nodata,
    :exec   => {
                 'df' => "df --local -P | awk {'if (NR!=1) print $6'} | xargs -I '{}' find '{}' -xdev -type f",
                 'find' => "find <partition> -xdev -type f -perm -2000",
               },
    :data   => Hash.new,
    :test   => Proc.new {
                 this = @@results['6']['1']['14']
                 if (
# TODO Put failure case here. Expecting:
# df => mounted filesystems or the following command can be run manually for each partition:
                    ) then
                   this[:result] = :fail
                 else
                   this[:result] = :pass
                 end
               },
  }

  # 6.2
  @@results['6']['2'] = Hash.new

  # 6.2.1 Ensure password fields are not empty
  @@results['6']['2']['1'] = {
    :title  => "Ensure password fields are not empty",
    :scored => true,
    :level  => {
                 :server      => '1',
                 :workstation => '1',
               },
    :result => :nodata,
    :exec   => {
                 'cat' => "cat /etc/shadow | awk -F: '($2 == \"\" ) { print $1 \" does not have a password \"}'",
               },
    :data   => Hash.new,
    :test   => Proc.new {
                 this = @@results['6']['2']['1']
                 if (
# TODO Put failure case here. Expecting:
                    ) then
                   this[:result] = :fail
                 else
                   this[:result] = :pass
                 end
               },
  }

  # 6.2.2 Ensure no legacy "+" entries exist in /etc/passwd
  @@results['6']['2']['2'] = {
    :title  => "Ensure no legacy \"+\" entries exist in /etc/passwd",
    :scored => true,
    :level  => {
                 :server      => '1',
                 :workstation => '1',
               },
    :result => :nodata,
    :exec   => {
                 'grep' => "grep '^+:' /etc/passwd",
               },
    :data   => Hash.new,
    :test   => Proc.new {
                 this = @@results['6']['2']['2']
                 if (
# TODO Put failure case here. Expecting:
                    ) then
                   this[:result] = :fail
                 else
                   this[:result] = :pass
                 end
               },
  }

  # 6.2.3 Ensure no legacy "+" entries exist in /etc/shadow
  @@results['6']['2']['3'] = {
    :title  => "Ensure no legacy \"+\" entries exist in /etc/shadow",
    :scored => true,
    :level  => {
                 :server      => '1',
                 :workstation => '1',
               },
    :result => :nodata,
    :exec   => {
                 'grep' => "grep '^+:' /etc/shadow",
               },
    :data   => Hash.new,
    :test   => Proc.new {
                 this = @@results['6']['2']['3']
                 if (
# TODO Put failure case here. Expecting:
                    ) then
                   this[:result] = :fail
                 else
                   this[:result] = :pass
                 end
               },
  }

  # 6.2.4 Ensure no legacy "+" entries exist in /etc/group
  @@results['6']['2']['4'] = {
    :title  => "Ensure no legacy \"+\" entries exist in /etc/group",
    :scored => true,
    :level  => {
                 :server      => '1',
                 :workstation => '1',
               },
    :result => :nodata,
    :exec   => {
                 'grep' => "grep '^+:' /etc/group",
               },
    :data   => Hash.new,
    :test   => Proc.new {
                 this = @@results['6']['2']['4']
                 if (
# TODO Put failure case here. Expecting:
                    ) then
                   this[:result] = :fail
                 else
                   this[:result] = :pass
                 end
               },
  }

  # 6.2.5 Ensure root is the only UID 0 account
  @@results['6']['2']['5'] = {
    :title  => "Ensure root is the only UID 0 account",
    :scored => true,
    :level  => {
                 :server      => '1',
                 :workstation => '1',
               },
    :result => :nodata,
    :exec   => {
                 'cat' => "cat /etc/passwd | awk -F: '($3 == 0) { print $1 }'",
               },
    :data   => Hash.new,
    :test   => Proc.new {
                 this = @@results['6']['2']['5']
                 if (
# TODO Put failure case here. Expecting:
# cat => root
                    ) then
                   this[:result] = :fail
                 else
                   this[:result] = :pass
                 end
               },
  }

  # 6.2.6 Ensure root PATH Integrity
  @@results['6']['2']['6'] = {
    :title  => "Ensure root PATH Integrity",
    :scored => true,
    :level  => {
                 :server      => '1',
                 :workstation => '1',
               },
    :result => :nodata,
    :exec   => {
               },
    :data   => Hash.new,
    :test   => Proc.new {
                 this = @@results['6']['2']['6']
                 if (
# TODO Put failure case here. Expecting:
# 0 => done
                    ) then
                   this[:result] = :fail
                 else
                   this[:result] = :pass
                 end
               },
  }

  # 6.2.7 Ensure all users' home directories exist
  @@results['6']['2']['7'] = {
    :title  => "Ensure all users' home directories exist",
    :scored => true,
    :level  => {
                 :server      => '1',
                 :workstation => '1',
               },
    :result => :nodata,
    :exec   => {
               },
    :data   => Hash.new,
    :test   => Proc.new {
                 this = @@results['6']['2']['7']
                 if (
# TODO Put failure case here. Expecting:
# 0 => done
                    ) then
                   this[:result] = :fail
                 else
                   this[:result] = :pass
                 end
               },
  }

  # 6.2.8 Ensure users' home directories permissions are 750 or more
  @@results['6']['2']['8'] = {
    :title  => "Ensure users' home directories permissions are 750 or more",
    :scored => false,
    :level  => {
                 :server      => '1',
                 :workstation => '1',
               },
    :result => :nodata,
    :exec   => {
               },
    :data   => Hash.new,
    :test   => Proc.new {
                 this = @@results['6']['2']['8']
                 if (
# TODO Put failure case here. Expecting:
# 0 => done
                    ) then
                   this[:result] = :fail
                 else
                   this[:result] = :pass
                 end
               },
  }

  # 6.2.9 Ensure users own their home directories
  @@results['6']['2']['9'] = {
    :title  => "Ensure users own their home directories",
    :scored => true,
    :level  => {
                 :server      => '1',
                 :workstation => '1',
               },
    :result => :nodata,
    :exec   => {
               },
    :data   => Hash.new,
    :test   => Proc.new {
                 this = @@results['6']['2']['9']
                 if (
# TODO Put failure case here. Expecting:
# 0 => done
                    ) then
                   this[:result] = :fail
                 else
                   this[:result] = :pass
                 end
               },
  }

  # 6.2.10 Ensure users' dot files are not group or world writable
  @@results['6']['2']['10'] = {
    :title  => "Ensure users' dot files are not group or world writable",
    :scored => true,
    :level  => {
                 :server      => '1',
                 :workstation => '1',
               },
    :result => :nodata,
    :exec   => {
               },
    :data   => Hash.new,
    :test   => Proc.new {
                 this = @@results['6']['2']['10']
                 if (
# TODO Put failure case here. Expecting:
# 0 => set on file $file"
                    ) then
                   this[:result] = :fail
                 else
                   this[:result] = :pass
                 end
               },
  }

  # 6.2.11 Ensure no users have .forward files
  @@results['6']['2']['11'] = {
    :title  => "Ensure no users have .forward files",
    :scored => true,
    :level  => {
                 :server      => '1',
                 :workstation => '1',
               },
    :result => :nodata,
    :exec   => {
               },
    :data   => Hash.new,
    :test   => Proc.new {
                 this = @@results['6']['2']['11']
                 if (
# TODO Put failure case here. Expecting:
# 0 => done
                    ) then
                   this[:result] = :fail
                 else
                   this[:result] = :pass
                 end
               },
  }

  # 6.2.12 Ensure no users have .netrc files
  @@results['6']['2']['12'] = {
    :title  => "Ensure no users have .netrc files",
    :scored => true,
    :level  => {
                 :server      => '1',
                 :workstation => '1',
               },
    :result => :nodata,
    :exec   => {
               },
    :data   => Hash.new,
    :test   => Proc.new {
                 this = @@results['6']['2']['12']
                 if (
# TODO Put failure case here. Expecting:
# 0 => done
                    ) then
                   this[:result] = :fail
                 else
                   this[:result] = :pass
                 end
               },
  }

  # 6.2.13 Ensure users' .netrc Files are not group or world accessible
  @@results['6']['2']['13'] = {
    :title  => "Ensure users' .netrc Files are not group or world accessible",
    :scored => false,
    :level  => {
                 :server      => '1',
                 :workstation => '1',
               },
    :result => :nodata,
    :exec   => {
               },
    :data   => Hash.new,
    :test   => Proc.new {
                 this = @@results['6']['2']['13']
                 if (
# TODO Put failure case here. Expecting:
# 0 => done
                    ) then
                   this[:result] = :fail
                 else
                   this[:result] = :pass
                 end
               },
  }

  # 6.2.14 Ensure no users have .rhosts files
  @@results['6']['2']['14'] = {
    :title  => "Ensure no users have .rhosts files",
    :scored => true,
    :level  => {
                 :server      => '1',
                 :workstation => '1',
               },
    :result => :nodata,
    :exec   => {
               },
    :data   => Hash.new,
    :test   => Proc.new {
                 this = @@results['6']['2']['14']
                 if (
# TODO Put failure case here. Expecting:
# 0 => $dir"
                    ) then
                   this[:result] = :fail
                 else
                   this[:result] = :pass
                 end
               },
  }

  # 6.2.15 Ensure all groups in /etc/passwd exist in /etc/group
  @@results['6']['2']['15'] = {
    :title  => "Ensure all groups in /etc/passwd exist in /etc/group",
    :scored => true,
    :level  => {
                 :server      => '1',
                 :workstation => '1',
               },
    :result => :nodata,
    :exec   => {
               },
    :data   => Hash.new,
    :test   => Proc.new {
                 this = @@results['6']['2']['15']
                 if (
# TODO Put failure case here. Expecting:
# 0 => done
                    ) then
                   this[:result] = :fail
                 else
                   this[:result] = :pass
                 end
               },
  }

  # 6.2.16 Ensure no duplicate UIDs exist
  @@results['6']['2']['16'] = {
    :title  => "Ensure no duplicate UIDs exist",
    :scored => true,
    :level  => {
                 :server      => '1',
                 :workstation => '1',
               },
    :result => :nodata,
    :exec   => {
               },
    :data   => Hash.new,
    :test   => Proc.new {
                 this = @@results['6']['2']['16']
                 if (
# TODO Put failure case here. Expecting:
# 0 => done
                    ) then
                   this[:result] = :fail
                 else
                   this[:result] = :pass
                 end
               },
  }

  # 6.2.17 Ensure no duplicate GIDs exist
  @@results['6']['2']['17'] = {
    :title  => "Ensure no duplicate GIDs exist",
    :scored => true,
    :level  => {
                 :server      => '1',
                 :workstation => '1',
               },
    :result => :nodata,
    :exec   => {
               },
    :data   => Hash.new,
    :test   => Proc.new {
                 this = @@results['6']['2']['17']
                 if (
# TODO Put failure case here. Expecting:
# 0 => done
                    ) then
                   this[:result] = :fail
                 else
                   this[:result] = :pass
                 end
               },
  }

  # 6.2.18 Ensure no duplicate user names exist
  @@results['6']['2']['18'] = {
    :title  => "Ensure no duplicate user names exist",
    :scored => true,
    :level  => {
                 :server      => '1',
                 :workstation => '1',
               },
    :result => :nodata,
    :exec   => {
               },
    :data   => Hash.new,
    :test   => Proc.new {
                 this = @@results['6']['2']['18']
                 if (
# TODO Put failure case here. Expecting:
# 0 => done
                    ) then
                   this[:result] = :fail
                 else
                   this[:result] = :pass
                 end
               },
  }

  # 6.2.19 Ensure no duplicate group names exist
  @@results['6']['2']['19'] = {
    :title  => "Ensure no duplicate group names exist",
    :scored => true,
    :level  => {
                 :server      => '1',
                 :workstation => '1',
               },
    :result => :nodata,
    :exec   => {
               },
    :data   => Hash.new,
    :test   => Proc.new {
                 this = @@results['6']['2']['19']
                 if (
# TODO Put failure case here. Expecting:
# 0 => done
                    ) then
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