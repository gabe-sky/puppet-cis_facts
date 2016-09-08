class CIS_5_CentOS7

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
  # 5
  @@results['5'] = Hash.new

  # 5.1
  @@results['5']['1'] = Hash.new

  # 5.1.2 Ensure permissions on /etc/crontab are configured
  @@results['5']['1']['2'] = {
    :title  => "Ensure permissions on /etc/crontab are configured",
    :scored => true,
    :level  => {
                 :server      => '1',
                 :workstation => '1',
               },
    :result => :nodata,
    :exec   => {
                 'stat' => "stat /etc/crontab",
               },
    :data   => Hash.new,
    :test   => Proc.new {
                 this = @@results['5']['1']['2']
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

  # 5.1.3 Ensure permissions on /etc/cron.hourly are configured
  @@results['5']['1']['3'] = {
    :title  => "Ensure permissions on /etc/cron.hourly are configured",
    :scored => true,
    :level  => {
                 :server      => '1',
                 :workstation => '1',
               },
    :result => :nodata,
    :exec   => {
                 'stat' => "stat /etc/cron.hourly",
               },
    :data   => Hash.new,
    :test   => Proc.new {
                 this = @@results['5']['1']['3']
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

  # 5.1.4 Ensure permissions on /etc/cron.daily are configured
  @@results['5']['1']['4'] = {
    :title  => "Ensure permissions on /etc/cron.daily are configured",
    :scored => true,
    :level  => {
                 :server      => '1',
                 :workstation => '1',
               },
    :result => :nodata,
    :exec   => {
                 'stat' => "stat /etc/cron.daily",
               },
    :data   => Hash.new,
    :test   => Proc.new {
                 this = @@results['5']['1']['4']
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

  # 5.1.5 Ensure permissions on /etc/cron.weekly are configured
  @@results['5']['1']['5'] = {
    :title  => "Ensure permissions on /etc/cron.weekly are configured",
    :scored => true,
    :level  => {
                 :server      => '1',
                 :workstation => '1',
               },
    :result => :nodata,
    :exec   => {
                 'stat' => "stat /etc/cron.weekly",
               },
    :data   => Hash.new,
    :test   => Proc.new {
                 this = @@results['5']['1']['5']
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

  # 5.1.6 Ensure permissions on /etc/cron.monthly are configured
  @@results['5']['1']['6'] = {
    :title  => "Ensure permissions on /etc/cron.monthly are configured",
    :scored => true,
    :level  => {
                 :server      => '1',
                 :workstation => '1',
               },
    :result => :nodata,
    :exec   => {
                 'stat' => "stat /etc/cron.monthly",
               },
    :data   => Hash.new,
    :test   => Proc.new {
                 this = @@results['5']['1']['6']
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

  # 5.1.7 Ensure permissions on /etc/cron.d are configured
  @@results['5']['1']['7'] = {
    :title  => "Ensure permissions on /etc/cron.d are configured",
    :scored => true,
    :level  => {
                 :server      => '1',
                 :workstation => '1',
               },
    :result => :nodata,
    :exec   => {
                 'stat' => "stat /etc/cron.d",
               },
    :data   => Hash.new,
    :test   => Proc.new {
                 this = @@results['5']['1']['7']
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

  # 5.1.8 Ensure at/cron is restricted to authorized users
  @@results['5']['1']['8'] = {
    :title  => "Ensure at/cron is restricted to authorized users",
    :scored => true,
    :level  => {
                 :server      => '1',
                 :workstation => '1',
               },
    :result => :nodata,
    :exec   => {
                 'stat' => "stat /etc/at.allow",
               },
    :data   => Hash.new,
    :test   => Proc.new {
                 this = @@results['5']['1']['8']
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

  # 5.2
  @@results['5']['2'] = Hash.new

  # 5.2.1 Ensure permissions on /etc/ssh/sshd_config are configured
  @@results['5']['2']['1'] = {
    :title  => "Ensure permissions on /etc/ssh/sshd_config are configured",
    :scored => false,
    :level  => {
                 :server      => '1',
                 :workstation => '1',
               },
    :result => :nodata,
    :exec   => {
                 'stat' => "stat /etc/ssh/sshd_config",
               },
    :data   => Hash.new,
    :test   => Proc.new {
                 this = @@results['5']['2']['1']
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

  # 5.2.2 Ensure SSH Protocol is set to 2
  @@results['5']['2']['2'] = {
    :title  => "Ensure SSH Protocol is set to 2",
    :scored => true,
    :level  => {
                 :server      => '1',
                 :workstation => '1',
               },
    :result => :nodata,
    :exec   => {
                 'grep' => "grep \"^Protocol\" /etc/ssh/sshd_config",
               },
    :data   => Hash.new,
    :test   => Proc.new {
                 this = @@results['5']['2']['2']
                 if (
# TODO Put failure case here. Expecting:
# grep => Protocol 2
                    ) then
                   this[:result] = :fail
                 else
                   this[:result] = :pass
                 end
               },
  }

  # 5.2.3 Ensure SSH LogLevel is set to INFO
  @@results['5']['2']['3'] = {
    :title  => "Ensure SSH LogLevel is set to INFO",
    :scored => true,
    :level  => {
                 :server      => '1',
                 :workstation => '1',
               },
    :result => :nodata,
    :exec   => {
                 'grep' => "grep \"^LogLevel\" /etc/ssh/sshd_config",
               },
    :data   => Hash.new,
    :test   => Proc.new {
                 this = @@results['5']['2']['3']
                 if (
# TODO Put failure case here. Expecting:
# grep => LogLevel INFO
                    ) then
                   this[:result] = :fail
                 else
                   this[:result] = :pass
                 end
               },
  }

  # 5.2.4 Ensure SSH X11 forwarding is disabled
  @@results['5']['2']['4'] = {
    :title  => "Ensure SSH X11 forwarding is disabled",
    :scored => true,
    :level  => {
                 :server      => '1',
                 :workstation => '1',
               },
    :result => :nodata,
    :exec   => {
                 'grep' => "grep \"^X11Forwarding\" /etc/ssh/sshd_config",
               },
    :data   => Hash.new,
    :test   => Proc.new {
                 this = @@results['5']['2']['4']
                 if (
# TODO Put failure case here. Expecting:
# grep => X11Forwarding no
                    ) then
                   this[:result] = :fail
                 else
                   this[:result] = :pass
                 end
               },
  }

  # 5.2.5 Ensure SSH MaxAuthTries is set to 4 or less
  @@results['5']['2']['5'] = {
    :title  => "Ensure SSH MaxAuthTries is set to 4 or less",
    :scored => true,
    :level  => {
                 :server      => '1',
                 :workstation => '1',
               },
    :result => :nodata,
    :exec   => {
                 'grep' => "grep \"^MaxAuthTries\" /etc/ssh/sshd_config",
               },
    :data   => Hash.new,
    :test   => Proc.new {
                 this = @@results['5']['2']['5']
                 if (
# TODO Put failure case here. Expecting:
# grep => MaxAuthTries 4
                    ) then
                   this[:result] = :fail
                 else
                   this[:result] = :pass
                 end
               },
  }

  # 5.2.6 Ensure SSH IgnoreRhosts is enabled
  @@results['5']['2']['6'] = {
    :title  => "Ensure SSH IgnoreRhosts is enabled",
    :scored => true,
    :level  => {
                 :server      => '1',
                 :workstation => '1',
               },
    :result => :nodata,
    :exec   => {
                 'grep' => "grep \"^IgnoreRhosts\" /etc/ssh/sshd_config",
               },
    :data   => Hash.new,
    :test   => Proc.new {
                 this = @@results['5']['2']['6']
                 if (
# TODO Put failure case here. Expecting:
# grep => IgnoreRhosts yes
                    ) then
                   this[:result] = :fail
                 else
                   this[:result] = :pass
                 end
               },
  }

  # 5.2.7 Ensure SSH HostbasedAuthentication is disabled
  @@results['5']['2']['7'] = {
    :title  => "Ensure SSH HostbasedAuthentication is disabled",
    :scored => true,
    :level  => {
                 :server      => '1',
                 :workstation => '1',
               },
    :result => :nodata,
    :exec   => {
                 'grep' => "grep \"^HostbasedAuthentication\" /etc/ssh/sshd_config",
               },
    :data   => Hash.new,
    :test   => Proc.new {
                 this = @@results['5']['2']['7']
                 if (
# TODO Put failure case here. Expecting:
# grep => HostbasedAuthentication no
                    ) then
                   this[:result] = :fail
                 else
                   this[:result] = :pass
                 end
               },
  }

  # 5.2.8 Ensure SSH root login is disabled
  @@results['5']['2']['8'] = {
    :title  => "Ensure SSH root login is disabled",
    :scored => true,
    :level  => {
                 :server      => '1',
                 :workstation => '1',
               },
    :result => :nodata,
    :exec   => {
                 'grep' => "grep \"^PermitRootLogin\" /etc/ssh/sshd_config",
               },
    :data   => Hash.new,
    :test   => Proc.new {
                 this = @@results['5']['2']['8']
                 if (
# TODO Put failure case here. Expecting:
# grep => PermitRootLogin no
                    ) then
                   this[:result] = :fail
                 else
                   this[:result] = :pass
                 end
               },
  }

  # 5.2.9 Ensure SSH PermitEmptyPasswords is disabled
  @@results['5']['2']['9'] = {
    :title  => "Ensure SSH PermitEmptyPasswords is disabled",
    :scored => true,
    :level  => {
                 :server      => '1',
                 :workstation => '1',
               },
    :result => :nodata,
    :exec   => {
                 'grep' => "grep \"^PermitEmptyPasswords\" /etc/ssh/sshd_config",
               },
    :data   => Hash.new,
    :test   => Proc.new {
                 this = @@results['5']['2']['9']
                 if (
# TODO Put failure case here. Expecting:
# grep => PermitEmptyPasswords no
                    ) then
                   this[:result] = :fail
                 else
                   this[:result] = :pass
                 end
               },
  }

  # 5.2.10 Ensure SSH PermitUserEnvironment is disabled
  @@results['5']['2']['10'] = {
    :title  => "Ensure SSH PermitUserEnvironment is disabled",
    :scored => true,
    :level  => {
                 :server      => '1',
                 :workstation => '1',
               },
    :result => :nodata,
    :exec   => {
                 'grep' => "grep PermitUserEnvironment /etc/ssh/sshd_config",
               },
    :data   => Hash.new,
    :test   => Proc.new {
                 this = @@results['5']['2']['10']
                 if (
# TODO Put failure case here. Expecting:
# grep => PermitUserEnvironment no
                    ) then
                   this[:result] = :fail
                 else
                   this[:result] = :pass
                 end
               },
  }

  # 5.2.11 Ensure only approved ciphers are used
  @@results['5']['2']['11'] = {
    :title  => "Ensure only approved ciphers are used",
    :scored => true,
    :level  => {
                 :server      => '1',
                 :workstation => '1',
               },
    :result => :nodata,
    :exec   => {
                 'grep' => "grep \"Ciphers\" /etc/ssh/sshd_config",
               },
    :data   => Hash.new,
    :test   => Proc.new {
                 this = @@results['5']['2']['11']
                 if (
# TODO Put failure case here. Expecting:
# grep => Ciphers aes256-ctr,aes192-ctr,aes128-ctr,aes256-gcm@openssh.com,aes128gcm@openssh.com,chacha20-poly1305@openssh.com
                    ) then
                   this[:result] = :fail
                 else
                   this[:result] = :pass
                 end
               },
  }

  # 5.2.12 Ensure only approved MAC algorithms are used
  @@results['5']['2']['12'] = {
    :title  => "Ensure only approved MAC algorithms are used",
    :scored => true,
    :level  => {
                 :server      => '1',
                 :workstation => '1',
               },
    :result => :nodata,
    :exec   => {
                 'grep' => "grep \"MACs\" /etc/ssh/sshd_config",
               },
    :data   => Hash.new,
    :test   => Proc.new {
                 this = @@results['5']['2']['12']
                 if (
# TODO Put failure case here. Expecting:
# grep => MACs hmac-sha2-512-etm@openssh.com,hmac-sha2-256-etm@openssh.com,umac-128etm@openssh.com,hmac-sha2-512,hmac-sha2-256,umac-128@openssh.com,curve25519sha256@libssh.org,diffie-hellman-group-exchange-sha256
                    ) then
                   this[:result] = :fail
                 else
                   this[:result] = :pass
                 end
               },
  }

  # 5.2.13 Ensure SSH Idle Timeout Interval is configured
  @@results['5']['2']['13'] = {
    :title  => "Ensure SSH Idle Timeout Interval is configured",
    :scored => true,
    :level  => {
                 :server      => '1',
                 :workstation => '1',
               },
    :result => :nodata,
    :exec   => {
                 'grep' => "grep \"^ClientAliveCountMax\" /etc/ssh/sshd_config",
               },
    :data   => Hash.new,
    :test   => Proc.new {
                 this = @@results['5']['2']['13']
                 if (
# TODO Put failure case here. Expecting:
# grep => ClientAliveCountMax 0
                    ) then
                   this[:result] = :fail
                 else
                   this[:result] = :pass
                 end
               },
  }

  # 5.2.14 Ensure SSH LoginGraceTime is set to one minute or less
  @@results['5']['2']['14'] = {
    :title  => "Ensure SSH LoginGraceTime is set to one minute or less",
    :scored => true,
    :level  => {
                 :server      => '1',
                 :workstation => '1',
               },
    :result => :nodata,
    :exec   => {
                 'grep' => "grep \"^LoginGraceTime\" /etc/ssh/sshd_config",
               },
    :data   => Hash.new,
    :test   => Proc.new {
                 this = @@results['5']['2']['14']
                 if (
# TODO Put failure case here. Expecting:
# grep => LoginGraceTime 60
                    ) then
                   this[:result] = :fail
                 else
                   this[:result] = :pass
                 end
               },
  }

  # 5.2.15 Ensure SSH access is limited
  @@results['5']['2']['15'] = {
    :title  => "Ensure SSH access is limited",
    :scored => true,
    :level  => {
                 :server      => '1',
                 :workstation => '1',
               },
    :result => :nodata,
    :exec   => {
                 'grep' => "grep \"^DenyGroups\" /etc/ssh/sshd_config",
               },
    :data   => Hash.new,
    :test   => Proc.new {
                 this = @@results['5']['2']['15']
                 if (
# TODO Put failure case here. Expecting:
# grep => DenyGroups <grouplist>
                    ) then
                   this[:result] = :fail
                 else
                   this[:result] = :pass
                 end
               },
  }

  # 5.2.16 Ensure SSH warning banner is configured
  @@results['5']['2']['16'] = {
    :title  => "Ensure SSH warning banner is configured",
    :scored => true,
    :level  => {
                 :server      => '1',
                 :workstation => '1',
               },
    :result => :nodata,
    :exec   => {
                 'grep' => "grep \"^Banner\" /etc/ssh/sshd_config",
               },
    :data   => Hash.new,
    :test   => Proc.new {
                 this = @@results['5']['2']['16']
                 if (
# TODO Put failure case here. Expecting:
# grep => Banner /etc/issue.net
                    ) then
                   this[:result] = :fail
                 else
                   this[:result] = :pass
                 end
               },
  }

  # 5.3
  @@results['5']['3'] = Hash.new

  # 5.3.1 Ensure password creation requirements are configured
  @@results['5']['3']['1'] = {
    :title  => "Ensure password creation requirements are configured",
    :scored => true,
    :level  => {
                 :server      => '1',
                 :workstation => '1',
               },
    :result => :nodata,
    :exec   => {
                 'grep' => "grep ^ucredit /etc/security/pwquality.conf",
               },
    :data   => Hash.new,
    :test   => Proc.new {
                 this = @@results['5']['3']['1']
                 if (
# TODO Put failure case here. Expecting:
# grep => ucredit=-1
                    ) then
                   this[:result] = :fail
                 else
                   this[:result] = :pass
                 end
               },
  }

  # 5.3.2 Ensure lockout for failed password attempts is configured
  @@results['5']['3']['2'] = {
    :title  => "Ensure lockout for failed password attempts is configured",
    :scored => true,
    :level  => {
                 :server      => '1',
                 :workstation => '1',
               },
    :result => :nodata,
    :exec   => {
                 'egrep' => "egrep '^password\s+sufficient\s+pam_unix.so' /etc/pam.d/system-auth",
               },
    :data   => Hash.new,
    :test   => Proc.new {
                 this = @@results['5']['3']['2']
                 if (
# TODO Put failure case here. Expecting:
# egrep => password sufficient pam_unix.so remember=5
                    ) then
                   this[:result] = :fail
                 else
                   this[:result] = :pass
                 end
               },
  }

  # 5.3.4 Ensure password hashing algorithm is SHA-512
  @@results['5']['3']['4'] = {
    :title  => "Ensure password hashing algorithm is SHA-512",
    :scored => true,
    :level  => {
                 :server      => '1',
                 :workstation => '1',
               },
    :result => :nodata,
    :exec   => {
                 'egrep' => "egrep '^password\s+sufficient\s+pam_unix.so' /etc/pam.d/system-auth",
               },
    :data   => Hash.new,
    :test   => Proc.new {
                 this = @@results['5']['3']['4']
                 if (
# TODO Put failure case here. Expecting:
# egrep => password sufficient pam_unix.so sha512
                    ) then
                   this[:result] = :fail
                 else
                   this[:result] = :pass
                 end
               },
  }

  # 5.4
  @@results['5']['4'] = Hash.new

  # 5.4.1
  @@results['5']['4']['1'] = Hash.new

  # 5.4.1.1 Ensure password expiration is 90 days or less
  @@results['5']['4']['1']['1'] = {
    :title  => "Ensure password expiration is 90 days or less",
    :scored => true,
    :level  => {
                 :server      => '1',
                 :workstation => '1',
               },
    :result => :nodata,
    :exec   => {
                 'chage' => "chage --list <user>",
                 'grep' => "grep PASS_MAX_DAYS /etc/login.defs",
                 'egrep' => "egrep ^[^:]+:[^\!*] /etc/shadow | cut -d: -f1",
               },
    :data   => Hash.new,
    :test   => Proc.new {
                 this = @@results['5']['4']['1']['1']
                 if (
# TODO Put failure case here. Expecting:
# chage => : 90
# grep => to 90 or less:
# egrep => <list of users>
                    ) then
                   this[:result] = :fail
                 else
                   this[:result] = :pass
                 end
               },
  }

  # 5.4.1.3 Ensure password expiration warning days is 7 or more
  @@results['5']['4']['1']['3'] = {
    :title  => "Ensure password expiration warning days is 7 or more",
    :scored => true,
    :level  => {
                 :server      => '1',
                 :workstation => '1',
               },
    :result => :nodata,
    :exec   => {
                 'chage' => "chage --list <user>",
                 'grep' => "grep PASS_WARN_AGE /etc/login.defs",
                 'egrep' => "egrep ^[^:]+:[^\!*] /etc/shadow | cut -d: -f1",
               },
    :data   => Hash.new,
    :test   => Proc.new {
                 this = @@results['5']['4']['1']['3']
                 if (
# TODO Put failure case here. Expecting:
# chage => : 7
# grep => expires set to 7 or more:
# egrep => <list of users>
                    ) then
                   this[:result] = :fail
                 else
                   this[:result] = :pass
                 end
               },
  }

  # 5.4.1.4 Ensure inactive password lock is 30 days or less
  @@results['5']['4']['1']['4'] = {
    :title  => "Ensure inactive password lock is 30 days or less",
    :scored => true,
    :level  => {
                 :server      => '1',
                 :workstation => '1',
               },
    :result => :nodata,
    :exec   => {
                 'chage' => "chage --list <user>",
                 'useradd' => "useradd -D | grep INACTIVE",
                 'egrep' => "egrep ^[^:]+:[^\!*] /etc/shadow | cut -d: -f1",
               },
    :data   => Hash.new,
    :test   => Proc.new {
                 this = @@results['5']['4']['1']['4']
                 if (
# TODO Put failure case here. Expecting:
# chage => : <date>
# useradd => password expires:
# egrep => <list of users>
                    ) then
                   this[:result] = :fail
                 else
                   this[:result] = :pass
                 end
               },
  }

  # 5.4.3 Ensure default group for the root account is GID 0
  @@results['5']['4']['3'] = {
    :title  => "Ensure default group for the root account is GID 0",
    :scored => true,
    :level  => {
                 :server      => '1',
                 :workstation => '1',
               },
    :result => :nodata,
    :exec   => {
                 'grep' => "grep \"^root:\" /etc/passwd | cut -f4 -d:",
               },
    :data   => Hash.new,
    :test   => Proc.new {
                 this = @@results['5']['4']['3']
                 if (
# TODO Put failure case here. Expecting:
# grep => 0
                    ) then
                   this[:result] = :fail
                 else
                   this[:result] = :pass
                 end
               },
  }

  # 5.4.4 Ensure default user umask is 027 or more restrictive
  @@results['5']['4']['4'] = {
    :title  => "Ensure default user umask is 027 or more restrictive",
    :scored => true,
    :level  => {
                 :server      => '1',
                 :workstation => '1',
               },
    :result => :nodata,
    :exec   => {
                 'grep' => "grep \"^umask\" /etc/profile",
               },
    :data   => Hash.new,
    :test   => Proc.new {
                 this = @@results['5']['4']['4']
                 if (
# TODO Put failure case here. Expecting:
# grep => umask 027
                    ) then
                   this[:result] = :fail
                 else
                   this[:result] = :pass
                 end
               },
  }

  # 5.5 Ensure root login is restricted to system console
  @@results['5']['5'] = {
    :title  => "Ensure root login is restricted to system console",
    :scored => false,
    :level  => {
                 :server      => '1',
                 :workstation => '1',
               },
    :result => :nodata,
    :exec   => {
                 'cat' => "cat /etc/securetty",
               },
    :data   => Hash.new,
    :test   => Proc.new {
                 this = @@results['5']['5']
                 if (
# TODO Put failure case here. Expecting:
                    ) then
                   this[:result] = :fail
                 else
                   this[:result] = :pass
                 end
               },
  }

  # 5.6 Ensure access to the su command is restricted
  @@results['5']['6'] = {
    :title  => "Ensure access to the su command is restricted",
    :scored => true,
    :level  => {
                 :server      => '1',
                 :workstation => '1',
               },
    :result => :nodata,
    :exec   => {
                 'grep' => "grep wheel /etc/group",
               },
    :data   => Hash.new,
    :test   => Proc.new {
                 this = @@results['5']['6']
                 if (
# TODO Put failure case here. Expecting:
# grep => wheel:x:10:root,<user list>
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