class CIS_4_CentOS7

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
  # 4
  @@results['4'] = Hash.new

  # 4.1
  @@results['4']['1'] = Hash.new

  # 4.1.1
  @@results['4']['1']['1'] = Hash.new

  # 4.1.1.1 Ensure audit log storage size is configured
  @@results['4']['1']['1']['1'] = {
    :title  => "Ensure audit log storage size is configured",
    :scored => false,
    :level  => {
                 :server      => '2',
                 :workstation => '2',
               },
    :result => :nodata,
    :exec   => {
                 'grep' => "grep max_log_file /etc/audit/auditd.conf",
               },
    :data   => Hash.new,
    :test   => Proc.new {
                 this = @@results['4']['1']['1']['1']
                 if (
# TODO Put failure case here. Expecting:
# grep => max_log_file = <MB>
                    ) then
                   this[:result] = :fail
                 else
                   this[:result] = :pass
                 end
               },
  }

  # 4.1.1.2 Ensure system is disabled when audit logs are full
  @@results['4']['1']['1']['2'] = {
    :title  => "Ensure system is disabled when audit logs are full",
    :scored => true,
    :level  => {
                 :server      => '2',
                 :workstation => '2',
               },
    :result => :nodata,
    :exec   => {
                 'grep' => "grep admin_space_left_action /etc/audit/auditd.conf",
               },
    :data   => Hash.new,
    :test   => Proc.new {
                 this = @@results['4']['1']['1']['2']
                 if (
# TODO Put failure case here. Expecting:
# grep => admin_space_left_action = halt
                    ) then
                   this[:result] = :fail
                 else
                   this[:result] = :pass
                 end
               },
  }

  # 4.1.1.3 Ensure audit logs are not automatically deleted
  @@results['4']['1']['1']['3'] = {
    :title  => "Ensure audit logs are not automatically deleted",
    :scored => true,
    :level  => {
                 :server      => '2',
                 :workstation => '2',
               },
    :result => :nodata,
    :exec   => {
                 'grep' => "grep max_log_file_action /etc/audit/auditd.conf",
               },
    :data   => Hash.new,
    :test   => Proc.new {
                 this = @@results['4']['1']['1']['3']
                 if (
# TODO Put failure case here. Expecting:
# grep => max_log_file_action = keep_logs
                    ) then
                   this[:result] = :fail
                 else
                   this[:result] = :pass
                 end
               },
  }

  # 4.1.2 Ensure auditd service is enabled
  @@results['4']['1']['2'] = {
    :title  => "Ensure auditd service is enabled",
    :scored => true,
    :level  => {
                 :server      => '2',
                 :workstation => '2',
               },
    :result => :nodata,
    :exec   => {
                 'systemctl' => "systemctl is-enabled auditd",
               },
    :data   => Hash.new,
    :test   => Proc.new {
                 this = @@results['4']['1']['2']
                 if (
# TODO Put failure case here. Expecting:
# systemctl => enabled
                    ) then
                   this[:result] = :fail
                 else
                   this[:result] = :pass
                 end
               },
  }

  # 4.1.3 Ensure auditing for processes that start prior to auditd is enabled
  @@results['4']['1']['3'] = {
    :title  => "Ensure auditing for processes that start prior to auditd is enabled",
    :scored => false,
    :level  => {
                 :server      => '2',
                 :workstation => '2',
               },
    :result => :nodata,
    :exec   => {
                 'grep' => "grep \"^\s*linux\" /boot/grub2/grub.cfg",
               },
    :data   => Hash.new,
    :test   => Proc.new {
                 this = @@results['4']['1']['3']
                 if (
# TODO Put failure case here. Expecting:
                    ) then
                   this[:result] = :fail
                 else
                   this[:result] = :pass
                 end
               },
  }

  # 4.1.4 Ensure events that modify date and time information are collected
  @@results['4']['1']['4'] = {
    :title  => "Ensure events that modify date and time information are collected",
    :scored => false,
    :level  => {
                 :server      => '2',
                 :workstation => '2',
               },
    :result => :nodata,
    :exec   => {
                 'grep' => "grep time-change /etc/audit/audit.rules",
               },
    :data   => Hash.new,
    :test   => Proc.new {
                 this = @@results['4']['1']['4']
                 if (
# TODO Put failure case here. Expecting:
# grep => -w /etc/localtime -p wa -k time-change
                    ) then
                   this[:result] = :fail
                 else
                   this[:result] = :pass
                 end
               },
  }

  # 4.1.5 Ensure events that modify user/group information are collected
  @@results['4']['1']['5'] = {
    :title  => "Ensure events that modify user/group information are collected",
    :scored => false,
    :level  => {
                 :server      => '2',
                 :workstation => '2',
               },
    :result => :nodata,
    :exec   => {
                 'grep' => "grep identity /etc/audit/audit.rules",
               },
    :data   => Hash.new,
    :test   => Proc.new {
                 this = @@results['4']['1']['5']
                 if (
# TODO Put failure case here. Expecting:
# grep => -w /etc/security/opasswd -p wa -k identity
                    ) then
                   this[:result] = :fail
                 else
                   this[:result] = :pass
                 end
               },
  }

  # 4.1.6 Ensure events that modify the system's network environment are
  @@results['4']['1']['6'] = {
    :title  => "Ensure events that modify the system's network environment are",
    :scored => false,
    :level  => {
                 :server      => '2',
                 :workstation => '2',
               },
    :result => :nodata,
    :exec   => {
                 'grep' => "grep system-locale /etc/audit/audit.rules",
               },
    :data   => Hash.new,
    :test   => Proc.new {
                 this = @@results['4']['1']['6']
                 if (
# TODO Put failure case here. Expecting:
# grep => -w /etc/sysconfig/network -p wa -k system-locale
                    ) then
                   this[:result] = :fail
                 else
                   this[:result] = :pass
                 end
               },
  }

  # 4.1.7 Ensure events that modify the system's Mandatory Access
  @@results['4']['1']['7'] = {
    :title  => "Ensure events that modify the system's Mandatory Access",
    :scored => false,
    :level  => {
                 :server      => '2',
                 :workstation => '2',
               },
    :result => :nodata,
    :exec   => {
                 'grep' => "grep MAC-policy /etc/audit/audit.rules",
               },
    :data   => Hash.new,
    :test   => Proc.new {
                 this = @@results['4']['1']['7']
                 if (
# TODO Put failure case here. Expecting:
# grep => -w /etc/selinux/ -p wa -k MAC-policy
                    ) then
                   this[:result] = :fail
                 else
                   this[:result] = :pass
                 end
               },
  }

  # 4.1.8 Ensure login and logout events are collected
  @@results['4']['1']['8'] = {
    :title  => "Ensure login and logout events are collected",
    :scored => true,
    :level  => {
                 :server      => '2',
                 :workstation => '2',
               },
    :result => :nodata,
    :exec   => {
                 'grep' => "grep logins /etc/audit/audit.rules",
               },
    :data   => Hash.new,
    :test   => Proc.new {
                 this = @@results['4']['1']['8']
                 if (
# TODO Put failure case here. Expecting:
# grep => -w /var/run/faillock/ -p wa -k logins
                    ) then
                   this[:result] = :fail
                 else
                   this[:result] = :pass
                 end
               },
  }

  # 4.1.9 Ensure session initiation information is collected
  @@results['4']['1']['9'] = {
    :title  => "Ensure session initiation information is collected",
    :scored => true,
    :level  => {
                 :server      => '2',
                 :workstation => '2',
               },
    :result => :nodata,
    :exec   => {
                 'grep' => "grep session /etc/audit/audit.rules",
               },
    :data   => Hash.new,
    :test   => Proc.new {
                 this = @@results['4']['1']['9']
                 if (
# TODO Put failure case here. Expecting:
# grep => -w /var/log/btmp -p wa -k session
                    ) then
                   this[:result] = :fail
                 else
                   this[:result] = :pass
                 end
               },
  }

  # 4.1.10 Ensure discretionary access control permission modification
  @@results['4']['1']['10'] = {
    :title  => "Ensure discretionary access control permission modification",
    :scored => false,
    :level  => {
                 :server      => '2',
                 :workstation => '2',
               },
    :result => :nodata,
    :exec   => {
                 'grep' => "grep perm_mod /etc/audit/audit.rules",
               },
    :data   => Hash.new,
    :test   => Proc.new {
                 this = @@results['4']['1']['10']
                 if (
# TODO Put failure case here. Expecting:
# grep => lremovexattr -S fremovexattr -F auid>=1000 -F auid!=4294967295 -k perm_mod
                    ) then
                   this[:result] = :fail
                 else
                   this[:result] = :pass
                 end
               },
  }

  # 4.1.11 Ensure unsuccessful unauthorized file access attempts are
  @@results['4']['1']['11'] = {
    :title  => "Ensure unsuccessful unauthorized file access attempts are",
    :scored => false,
    :level  => {
                 :server      => '2',
                 :workstation => '2',
               },
    :result => :nodata,
    :exec   => {
                 'grep' => "grep access /etc/audit/audit.rules",
               },
    :data   => Hash.new,
    :test   => Proc.new {
                 this = @@results['4']['1']['11']
                 if (
# TODO Put failure case here. Expecting:
# grep => -S ftruncate -F
                    ) then
                   this[:result] = :fail
                 else
                   this[:result] = :pass
                 end
               },
  }

  # 4.1.12 Ensure use of privileged commands is collected
  @@results['4']['1']['12'] = {
    :title  => "Ensure use of privileged commands is collected",
    :scored => true,
    :level  => {
                 :server      => '2',
                 :workstation => '2',
               },
    :result => :nodata,
    :exec   => {
                 'find' => "find <partition> -xdev \( -perm -4000 -o -perm -2000 \) -type f | awk '{print \"-a",
               },
    :data   => Hash.new,
    :test   => Proc.new {
                 this = @@results['4']['1']['12']
                 if (
# TODO Put failure case here. Expecting:
# find => Verify all resulting lines are in the /etc/audit/audit.rules file.
                    ) then
                   this[:result] = :fail
                 else
                   this[:result] = :pass
                 end
               },
  }

  # 4.1.13 Ensure successful file system mounts are collected
  @@results['4']['1']['13'] = {
    :title  => "Ensure successful file system mounts are collected",
    :scored => true,
    :level  => {
                 :server      => '2',
                 :workstation => '2',
               },
    :result => :nodata,
    :exec   => {
                 'grep' => "grep mounts /etc/audit/audit.rules",
               },
    :data   => Hash.new,
    :test   => Proc.new {
                 this = @@results['4']['1']['13']
                 if (
# TODO Put failure case here. Expecting:
# grep => -a always,exit -F arch=b32 -S mount -F auid>=1000 -F auid!=4294967295 -k mounts
                    ) then
                   this[:result] = :fail
                 else
                   this[:result] = :pass
                 end
               },
  }

  # 4.1.14 Ensure file deletion events by users are collected
  @@results['4']['1']['14'] = {
    :title  => "Ensure file deletion events by users are collected",
    :scored => true,
    :level  => {
                 :server      => '2',
                 :workstation => '2',
               },
    :result => :nodata,
    :exec   => {
                 'grep' => "grep delete /etc/audit/audit.rules",
               },
    :data   => Hash.new,
    :test   => Proc.new {
                 this = @@results['4']['1']['14']
                 if (
# TODO Put failure case here. Expecting:
# grep => -a always,exit -F arch=b32 -S unlink -S unlinkat -S rename -S renameat -F auid>=1000 F auid!=4294967295 -k delete
                    ) then
                   this[:result] = :fail
                 else
                   this[:result] = :pass
                 end
               },
  }

  # 4.1.15 Ensure changes to system administration scope
  @@results['4']['1']['15'] = {
    :title  => "Ensure changes to system administration scope",
    :scored => false,
    :level  => {
                 :server      => '2',
                 :workstation => '2',
               },
    :result => :nodata,
    :exec   => {
                 'grep' => "grep scope /etc/audit/audit.rules",
               },
    :data   => Hash.new,
    :test   => Proc.new {
                 this = @@results['4']['1']['15']
                 if (
# TODO Put failure case here. Expecting:
# grep => -w /etc/sudoers.d -p wa -k scope
                    ) then
                   this[:result] = :fail
                 else
                   this[:result] = :pass
                 end
               },
  }

  # 4.1.16 Ensure system administrator actions
  @@results['4']['1']['16'] = {
    :title  => "Ensure system administrator actions",
    :scored => false,
    :level  => {
                 :server      => '2',
                 :workstation => '2',
               },
    :result => :nodata,
    :exec   => {
                 'grep' => "grep actions /etc/audit/audit.rules",
               },
    :data   => Hash.new,
    :test   => Proc.new {
                 this = @@results['4']['1']['16']
                 if (
# TODO Put failure case here. Expecting:
# grep => -w /var/log/sudo.log -p wa -k actions
                    ) then
                   this[:result] = :fail
                 else
                   this[:result] = :pass
                 end
               },
  }

  # 4.1.17 Ensure kernel module loading and unloading is collected
  @@results['4']['1']['17'] = {
    :title  => "Ensure kernel module loading and unloading is collected",
    :scored => true,
    :level  => {
                 :server      => '2',
                 :workstation => '2',
               },
    :result => :nodata,
    :exec   => {
                 'grep' => "grep modules /etc/audit/audit.rules",
               },
    :data   => Hash.new,
    :test   => Proc.new {
                 this = @@results['4']['1']['17']
                 if (
# TODO Put failure case here. Expecting:
# grep => -a always,exit arch=b64 -S init_module -S delete_module -k modules
                    ) then
                   this[:result] = :fail
                 else
                   this[:result] = :pass
                 end
               },
  }

  # 4.1.18 Ensure the audit configuration is immutable
  @@results['4']['1']['18'] = {
    :title  => "Ensure the audit configuration is immutable",
    :scored => true,
    :level  => {
                 :server      => '2',
                 :workstation => '2',
               },
    :result => :nodata,
    :exec   => {
                 'grep' => "grep \"^\s*[^#]\" /etc/audit/audit.rules | tail -1",
               },
    :data   => Hash.new,
    :test   => Proc.new {
                 this = @@results['4']['1']['18']
                 if (
# TODO Put failure case here. Expecting:
# grep => -e 2
                    ) then
                   this[:result] = :fail
                 else
                   this[:result] = :pass
                 end
               },
  }

  # 4.2
  @@results['4']['2'] = Hash.new

  # 4.2.1
  @@results['4']['2']['1'] = Hash.new

  # 4.2.1.1 Ensure rsyslog Service is enabled
  @@results['4']['2']['1']['1'] = {
    :title  => "Ensure rsyslog Service is enabled",
    :scored => true,
    :level  => {
                 :server      => '1',
                 :workstation => '1',
               },
    :result => :nodata,
    :exec   => {
                 'systemctl' => "systemctl is-enabled rsyslog",
               },
    :data   => Hash.new,
    :test   => Proc.new {
                 this = @@results['4']['2']['1']['1']
                 if (
# TODO Put failure case here. Expecting:
# systemctl => enabled
                    ) then
                   this[:result] = :fail
                 else
                   this[:result] = :pass
                 end
               },
  }

  # 4.2.1.2 Ensure logging is configured
  @@results['4']['2']['1']['2'] = {
    :title  => "Ensure logging is configured",
    :scored => false,
    :level  => {
                 :server      => '1',
                 :workstation => '1',
               },
    :result => :nodata,
    :exec   => {
                 'ls' => "ls -l /var/log/",
               },
    :data   => Hash.new,
    :test   => Proc.new {
                 this = @@results['4']['2']['1']['2']
                 if (
# TODO Put failure case here. Expecting:
                    ) then
                   this[:result] = :fail
                 else
                   this[:result] = :pass
                 end
               },
  }

  # 4.2.1.3 Ensure rsyslog default file permissions configured
  @@results['4']['2']['1']['3'] = {
    :title  => "Ensure rsyslog default file permissions configured",
    :scored => true,
    :level  => {
                 :server      => '1',
                 :workstation => '1',
               },
    :result => :nodata,
    :exec   => {
                 'grep' => "grep ^\$FileCreateMode /etc/rsyslog.conf",
               },
    :data   => Hash.new,
    :test   => Proc.new {
                 this = @@results['4']['2']['1']['3']
                 if (
# TODO Put failure case here. Expecting:
                    ) then
                   this[:result] = :fail
                 else
                   this[:result] = :pass
                 end
               },
  }

  # 4.2.1.4 Ensure rsyslog is configured to send logs to a remote log host
  @@results['4']['2']['1']['4'] = {
    :title  => "Ensure rsyslog is configured to send logs to a remote log host",
    :scored => false,
    :level  => {
                 :server      => '1',
                 :workstation => '1',
               },
    :result => :nodata,
    :exec   => {
                 'grep' => "grep \"^*.*[^I][^I]*@\" /etc/rsyslog.conf",
               },
    :data   => Hash.new,
    :test   => Proc.new {
                 this = @@results['4']['2']['1']['4']
                 if (
# TODO Put failure case here. Expecting:
# grep => *.* @@loghost.example.com
                    ) then
                   this[:result] = :fail
                 else
                   this[:result] = :pass
                 end
               },
  }

  # 4.2.1.5 Ensure remote rsyslog messages are only accepted on
  @@results['4']['2']['1']['5'] = {
    :title  => "Ensure remote rsyslog messages are only accepted on",
    :scored => false,
    :level  => {
                 :server      => '1',
                 :workstation => '1',
               },
    :result => :nodata,
    :exec   => {
                 'grep' => "grep '$InputTCPServerRun' /etc/rsyslog.conf",
               },
    :data   => Hash.new,
    :test   => Proc.new {
                 this = @@results['4']['2']['1']['5']
                 if (
# TODO Put failure case here. Expecting:
# grep => $InputTCPServerRun 514
                    ) then
                   this[:result] = :fail
                 else
                   this[:result] = :pass
                 end
               },
  }

  # 4.2.2
  @@results['4']['2']['2'] = Hash.new

  # 4.2.2.1 Ensure syslog-ng service is enabled
  @@results['4']['2']['2']['1'] = {
    :title  => "Ensure syslog-ng service is enabled",
    :scored => true,
    :level  => {
                 :server      => '1',
                 :workstation => '1',
               },
    :result => :nodata,
    :exec   => {
                 'systemctl' => "systemctl is-enabled syslog-ng",
               },
    :data   => Hash.new,
    :test   => Proc.new {
                 this = @@results['4']['2']['2']['1']
                 if (
# TODO Put failure case here. Expecting:
# systemctl => enabled
                    ) then
                   this[:result] = :fail
                 else
                   this[:result] = :pass
                 end
               },
  }

  # 4.2.2.2 Ensure logging is configured
  @@results['4']['2']['2']['2'] = {
    :title  => "Ensure logging is configured",
    :scored => false,
    :level  => {
                 :server      => '1',
                 :workstation => '1',
               },
    :result => :nodata,
    :exec   => {
                 'ls' => "ls -l /var/log/",
               },
    :data   => Hash.new,
    :test   => Proc.new {
                 this = @@results['4']['2']['2']['2']
                 if (
# TODO Put failure case here. Expecting:
                    ) then
                   this[:result] = :fail
                 else
                   this[:result] = :pass
                 end
               },
  }

  # 4.2.2.3 Ensure syslog-ng default file permissions configured
  @@results['4']['2']['2']['3'] = {
    :title  => "Ensure syslog-ng default file permissions configured",
    :scored => true,
    :level  => {
                 :server      => '1',
                 :workstation => '1',
               },
    :result => :nodata,
    :exec   => {
                 'grep' => "grep ^options /etc/syslog-ng/syslog-ng.conf",
               },
    :data   => Hash.new,
    :test   => Proc.new {
                 this = @@results['4']['2']['2']['3']
                 if (
# TODO Put failure case here. Expecting:
# grep => threaded(yes); };
                    ) then
                   this[:result] = :fail
                 else
                   this[:result] = :pass
                 end
               },
  }

  # 4.2.3 Ensure rsyslog or syslog-ng is installed
  @@results['4']['2']['3'] = {
    :title  => "Ensure rsyslog or syslog-ng is installed",
    :scored => true,
    :level  => {
                 :server      => '1',
                 :workstation => '1',
               },
    :result => :nodata,
    :exec   => {
                 'rpm' => "rpm -q syslog-ng",
               },
    :data   => Hash.new,
    :test   => Proc.new {
                 this = @@results['4']['2']['3']
                 if (
# TODO Put failure case here. Expecting:
                    ) then
                   this[:result] = :fail
                 else
                   this[:result] = :pass
                 end
               },
  }

  # 4.2.4 Ensure permissions on all logfiles are configured
  @@results['4']['2']['4'] = {
    :title  => "Ensure permissions on all logfiles are configured",
    :scored => true,
    :level  => {
                 :server      => '1',
                 :workstation => '1',
               },
    :result => :nodata,
    :exec   => {
                 'find' => "find /var/log -type f -ls",
               },
    :data   => Hash.new,
    :test   => Proc.new {
                 this = @@results['4']['2']['4']
                 if (
# TODO Put failure case here. Expecting:
                    ) then
                   this[:result] = :fail
                 else
                   this[:result] = :pass
                 end
               },
  }

  # 4.3 Ensure logrotate is configured
  @@results['4']['3'] = {
    :title  => "Ensure logrotate is configured",
    :scored => false,
    :level  => {
                 :server      => '1',
                 :workstation => '1',
               },
    :result => :nodata,
    :exec   => {
                 'systemctl' => "systemctl is-enabled crond",
               },
    :data   => Hash.new,
    :test   => Proc.new {
                 this = @@results['4']['3']
                 if (
# TODO Put failure case here. Expecting:
# systemctl => enabled
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