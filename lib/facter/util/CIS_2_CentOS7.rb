class CIS_2_CentOS7

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
  # 2
  @@results['2'] = Hash.new

  # 2.1
  @@results['2']['1'] = Hash.new

  # 2.1.1 Ensure chargen services are not enabled
  @@results['2']['1']['1'] = {
    :title  => "Ensure chargen services are not enabled",
    :scored => true,
    :level  => {
                 :server      => '1',
                 :workstation => '1',
               },
    :result => :nodata,
    :exec   => {
                 'chkconfig' => "chkconfig --list",
               },
    :data   => Hash.new,
    :test   => Proc.new {
                 this = @@results['2']['1']['1']
                 if ( this[:data]['chkconfig'] =~ /chargen-dgram.+:on.+/ ||
                      this[:data]['chkconfig'] =~ /chargen-stream.+:on.+/ ) then
                   this[:result] = :fail
                 else
                   this[:result] = :pass
                 end
               },
  }

  # 2.1.2 Ensure daytime services are not enabled
  @@results['2']['1']['2'] = {
    :title  => "Ensure daytime services are not enabled",
    :scored => true,
    :level  => {
                 :server      => '1',
                 :workstation => '1',
               },
    :result => :nodata,
    :exec   => {
                 'chkconfig' => "chkconfig --list",
               },
    :data   => Hash.new,
    :test   => Proc.new {
                 this = @@results['2']['1']['2']
                 if ( this[:data]['chkconfig'] =~ /daytime-dgram.+:on.+/ ||
                      this[:data]['chkconfig'] =~ /daytime-stream.+:on.+/ ) then
                   this[:result] = :fail
                 else
                   this[:result] = :pass
                 end
               },
  }

  # 2.1.3 Ensure discard services are not enabled
  @@results['2']['1']['3'] = {
    :title  => "Ensure discard services are not enabled",
    :scored => true,
    :level  => {
                 :server      => '1',
                 :workstation => '1',
               },
    :result => :nodata,
    :exec   => {
                 'chkconfig' => "chkconfig --list",
               },
    :data   => Hash.new,
    :test   => Proc.new {
                 this = @@results['2']['1']['3']
                 if ( this[:data]['chkconfig'] =~ /discard-dgram.+:on.+/ ||
                      this[:data]['chkconfig'] =~ /discard-stream.+:on.+/ ) then
                   this[:result] = :fail
                 else
                   this[:result] = :pass
                 end
               },
  }

  # 2.1.4 Ensure echo services are not enabled
  @@results['2']['1']['4'] = {
    :title  => "Ensure echo services are not enabled",
    :scored => true,
    :level  => {
                 :server      => '1',
                 :workstation => '1',
               },
    :result => :nodata,
    :exec   => {
                 'chkconfig' => "chkconfig --list",
               },
    :data   => Hash.new,
    :test   => Proc.new {
                 this = @@results['2']['1']['4']
                 if ( this[:data]['chkconfig'] =~ /echo-dgram.+:on.+/ ||
                      this[:data]['chkconfig'] =~ /echo-stream.+:on.+/ ) then
                   this[:result] = :fail
                 else
                   this[:result] = :pass
                 end
               },
  }

  # 2.1.5 Ensure time services are not enabled
  @@results['2']['1']['5'] = {
    :title  => "Ensure time services are not enabled",
    :scored => true,
    :level  => {
                 :server      => '1',
                 :workstation => '1',
               },
    :result => :nodata,
    :exec   => {
                 'chkconfig' => "chkconfig --list",
               },
    :data   => Hash.new,
    :test   => Proc.new {
                 this = @@results['2']['1']['5']
                 if ( this[:data]['chkconfig'] =~ /time-dgram.+:on.+/ ||
                      this[:data]['chkconfig'] =~ /time-stream.+:on.+/ ) then
                   this[:result] = :fail
                 else
                   this[:result] = :pass
                 end
               },
  }

  # 2.1.6 Ensure tftp server is not enabled
  @@results['2']['1']['6'] = {
    :title  => "Ensure tftp server is not enabled",
    :scored => true,
    :level  => {
                 :server      => '1',
                 :workstation => '1',
               },
    :result => :nodata,
    :exec   => {
                 'chkconfig' => "chkconfig --list",
               },
    :data   => Hash.new,
    :test   => Proc.new {
                 this = @@results['2']['1']['6']
                 if ( this[:data]['chkconfig'] =~ /tftp.+:on.+/ ) then
                   this[:result] = :fail
                 else
                   this[:result] = :pass
                 end
               },
  }

  # 2.1.7 Ensure xinetd is not enabled
  @@results['2']['1']['7'] = {
    :title  => "Ensure xinetd is not enabled",
    :scored => true,
    :level  => {
                 :server      => '1',
                 :workstation => '1',
               },
    :result => :nodata,
    :exec   => {
                 'systemctl' => "systemctl is-enabled xinetd",
               },
    :data   => Hash.new,
    :test   => Proc.new {
                 this = @@results['2']['1']['7']
                 if ( this[:data]['systemctl'] != 'disabled' &&
                      this[:data]['systemctl'] != '' ) then
                   this[:result] = :fail
                 else
                   this[:result] = :pass
                 end
               },
  }

  # 2.2
  @@results['2']['2'] = Hash.new

  # 2.2.1
  @@results['2']['2']['1'] = Hash.new

  # 2.2.1.1 Ensure time synchronization is in use
  @@results['2']['2']['1']['1'] = {
    :title  => "Ensure time synchronization is in use",
    :scored => false,
    :level  => {
                 :server      => '1',
                 :workstation => '1',
               },
    :result => :nodata,
    :exec   => {
                 'rpm_ntp'    => "rpm -q ntp",
                 'rpm_chrony' => "rpm -q chrony",
               },
    :data   => Hash.new,
    :test   => Proc.new {
                 this = @@results['2']['2']['1']['1']
                 if ( this[:data]['rpm_ntp'] == 'package ntp is not installed' &&
                      this[:data]['rpm_chrony'] == 'package chrony is not installed' ) then
                   this[:result] = :fail
                 else
                   this[:result] = :pass
                 end
               },
  }

  # 2.2.1.2 Ensure ntp is configured
  @@results['2']['2']['1']['2'] = {
    :title  => "Ensure ntp is configured",
    :scored => true,
    :level  => {
                 :server      => '1',
                 :workstation => '1',
               },
    :result => :nodata,
    :exec   => {
                 'grep1' => "grep \"^ExecStart\" /usr/lib/systemd/system/ntpd.service",
                 'grep2' => "grep \"^server\" /etc/ntp.conf",
                 'grep3' => "grep \"^OPTIONS\" /etc/sysconfig/ntp",
                 'grep4' => "grep \"^ExecStart\" /usr/lib/systemd/system/ntpd.service",
               },
    :data   => Hash.new,
    :test   => Proc.new {
                 this   = @@results['2']['2']['1']['2']
                 parent = @@results['2']['2']['1']['1']
                 if ( parent[:data]['rpm_ntp'] == 'package ntp is not installed') then
                   this[:result] = :skip
                 else
                   test1 = true
                   lines = this[:data]['grep1'].split("\n")
                   if (lines[0] =~ /^restrict\s+(-4\s+)?default\s+(?<options>.+)$/) then
                     option_list = options.split(/\s+/)
                     test1 = false unless option_list.include? kod
                     test1 = false unless option_list.include? nomodify
                     test1 = false unless option_list.include? notrap
                     test1 = false unless option_list.include? nopeer
                     test1 = false unless option_list.include? noquery
                   else
                     test1 = false
                   end
                   if (test1) then
                     valid6 = false
                     lines.each do
                       |line|
                       if (line =~ /^restrict\s+-6\s+default\s+(?<options>.+)$/) then
                         option_list = options.split(/\s+/)
                         valid6 = true
                         valid6 = false unless option_list.include? kod
                         valid6 = false unless option_list.include? nomodify
                         valid6 = false unless option_list.include? notrap
                         valid6 = false unless option_list.include? nopeer
                         valid6 = false unless option_list.include? noquery
                       end
                     end
                   end
                   test1 = false unless valid6
                   test2 = (this[:data]['grep2'] =~ /server\s+\S+/) ? true : false
                   test3 = (this[:data]['grep3'] == 'OPTIONS="-u ntp:ntp"') ? true : false
                   test4 = (this[:data]['grep4'] == 'ExecStart=/usr/sbin/ntpd -u ntp:ntp $OPTIONS') ? true : false
                   if ( test1 && test2 && (test3 || test4)) then
                     this[:result] = :pass
                   else
                     this[:result] = :fail
                   end
                 end
               },
  }

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
                 'grep' => "grep ^OPTIONS /etc/sysconfig/chronyd",
               },
    :data   => Hash.new,
    :test   => Proc.new {
                 this = @@results['2']['2']['1']['3']
                 if (
# TODO Put failure case here. Expecting:
# grep => Additional options may be present.
                    ) then
                   this[:result] = :fail
                 else
                   this[:result] = :pass
                 end
               },
  }

  # 2.2.2 Ensure X Window System is not installed
  @@results['2']['2']['2'] = {
    :title  => "Ensure X Window System is not installed",
    :scored => true,
    :level  => {
                 :server      => '1',
                 :workstation => '0',
               },
    :result => :nodata,
    :exec   => {
                 'rpm' => "rpm -qa xorg-x11*",
               },
    :data   => Hash.new,
    :test   => Proc.new {
                 this = @@results['2']['2']['2']
                 if (
# TODO Put failure case here. Expecting:
                    ) then
                   this[:result] = :fail
                 else
                   this[:result] = :pass
                 end
               },
  }

  # 2.2.3 Ensure Avahi Server is not enabled
  @@results['2']['2']['3'] = {
    :title  => "Ensure Avahi Server is not enabled",
    :scored => true,
    :level  => {
                 :server      => '1',
                 :workstation => '1',
               },
    :result => :nodata,
    :exec   => {
                 'systemctl' => "systemctl is-enabled avahi-daemon",
               },
    :data   => Hash.new,
    :test   => Proc.new {
                 this = @@results['2']['2']['3']
                 if (
# TODO Put failure case here. Expecting:
# systemctl => disabled
                    ) then
                   this[:result] = :fail
                 else
                   this[:result] = :pass
                 end
               },
  }

  # 2.2.4 Ensure CUPS is not enabled
  @@results['2']['2']['4'] = {
    :title  => "Ensure CUPS is not enabled",
    :scored => true,
    :level  => {
                 :server      => '1',
                 :workstation => '2',
               },
    :result => :nodata,
    :exec   => {
                 'systemctl' => "systemctl is-enabled cups",
               },
    :data   => Hash.new,
    :test   => Proc.new {
                 this = @@results['2']['2']['4']
                 if (
# TODO Put failure case here. Expecting:
# systemctl => disabled
                    ) then
                   this[:result] = :fail
                 else
                   this[:result] = :pass
                 end
               },
  }

  # 2.2.5 Ensure DHCP Server is not enabled
  @@results['2']['2']['5'] = {
    :title  => "Ensure DHCP Server is not enabled",
    :scored => true,
    :level  => {
                 :server      => '1',
                 :workstation => '1',
               },
    :result => :nodata,
    :exec   => {
                 'systemctl' => "systemctl is-enabled dhcpd",
               },
    :data   => Hash.new,
    :test   => Proc.new {
                 this = @@results['2']['2']['5']
                 if (
# TODO Put failure case here. Expecting:
# systemctl => disabled
                    ) then
                   this[:result] = :fail
                 else
                   this[:result] = :pass
                 end
               },
  }

  # 2.2.6 Ensure LDAP server is not enabled
  @@results['2']['2']['6'] = {
    :title  => "Ensure LDAP server is not enabled",
    :scored => true,
    :level  => {
                 :server      => '1',
                 :workstation => '1',
               },
    :result => :nodata,
    :exec   => {
                 'systemctl' => "systemctl is-enabled slapd",
               },
    :data   => Hash.new,
    :test   => Proc.new {
                 this = @@results['2']['2']['6']
                 if (
# TODO Put failure case here. Expecting:
# systemctl => disabled
                    ) then
                   this[:result] = :fail
                 else
                   this[:result] = :pass
                 end
               },
  }

  # 2.2.7 Ensure NFS and RPC are not enabled
  @@results['2']['2']['7'] = {
    :title  => "Ensure NFS and RPC are not enabled",
    :scored => true,
    :level  => {
                 :server      => '1',
                 :workstation => '1',
               },
    :result => :nodata,
    :exec   => {
                 'systemctl' => "systemctl is-enabled rpcbind",
               },
    :data   => Hash.new,
    :test   => Proc.new {
                 this = @@results['2']['2']['7']
                 if (
# TODO Put failure case here. Expecting:
# systemctl => disabled
                    ) then
                   this[:result] = :fail
                 else
                   this[:result] = :pass
                 end
               },
  }

  # 2.2.8 Ensure DNS Server is not enabled
  @@results['2']['2']['8'] = {
    :title  => "Ensure DNS Server is not enabled",
    :scored => true,
    :level  => {
                 :server      => '1',
                 :workstation => '1',
               },
    :result => :nodata,
    :exec   => {
                 'systemctl' => "systemctl is-enabled named",
               },
    :data   => Hash.new,
    :test   => Proc.new {
                 this = @@results['2']['2']['8']
                 if (
# TODO Put failure case here. Expecting:
# systemctl => disabled
                    ) then
                   this[:result] = :fail
                 else
                   this[:result] = :pass
                 end
               },
  }

  # 2.2.9 Ensure FTP Server is not enabled
  @@results['2']['2']['9'] = {
    :title  => "Ensure FTP Server is not enabled",
    :scored => true,
    :level  => {
                 :server      => '1',
                 :workstation => '1',
               },
    :result => :nodata,
    :exec   => {
                 'systemctl' => "systemctl is-enabled vsftpd",
               },
    :data   => Hash.new,
    :test   => Proc.new {
                 this = @@results['2']['2']['9']
                 if (
# TODO Put failure case here. Expecting:
# systemctl => disabled
                    ) then
                   this[:result] = :fail
                 else
                   this[:result] = :pass
                 end
               },
  }

  # 2.2.10 Ensure HTTP server is not enabled
  @@results['2']['2']['10'] = {
    :title  => "Ensure HTTP server is not enabled",
    :scored => true,
    :level  => {
                 :server      => '1',
                 :workstation => '1',
               },
    :result => :nodata,
    :exec   => {
                 'systemctl' => "systemctl is-enabled httpd",
               },
    :data   => Hash.new,
    :test   => Proc.new {
                 this = @@results['2']['2']['10']
                 if (
# TODO Put failure case here. Expecting:
# systemctl => disabled
                    ) then
                   this[:result] = :fail
                 else
                   this[:result] = :pass
                 end
               },
  }

  # 2.2.11 Ensure IMAP and POP3 server is not enabled
  @@results['2']['2']['11'] = {
    :title  => "Ensure IMAP and POP3 server is not enabled",
    :scored => true,
    :level  => {
                 :server      => '1',
                 :workstation => '1',
               },
    :result => :nodata,
    :exec   => {
                 'systemctl' => "systemctl is-enabled dovecot",
               },
    :data   => Hash.new,
    :test   => Proc.new {
                 this = @@results['2']['2']['11']
                 if (
# TODO Put failure case here. Expecting:
# systemctl => disabled
                    ) then
                   this[:result] = :fail
                 else
                   this[:result] = :pass
                 end
               },
  }

  # 2.2.12 Ensure Samba is not enabled
  @@results['2']['2']['12'] = {
    :title  => "Ensure Samba is not enabled",
    :scored => true,
    :level  => {
                 :server      => '1',
                 :workstation => '1',
               },
    :result => :nodata,
    :exec   => {
                 'systemctl' => "systemctl is-enabled smb",
               },
    :data   => Hash.new,
    :test   => Proc.new {
                 this = @@results['2']['2']['12']
                 if (
# TODO Put failure case here. Expecting:
# systemctl => disabled
                    ) then
                   this[:result] = :fail
                 else
                   this[:result] = :pass
                 end
               },
  }

  # 2.2.13 Ensure HTTP Proxy Server is not enabled
  @@results['2']['2']['13'] = {
    :title  => "Ensure HTTP Proxy Server is not enabled",
    :scored => true,
    :level  => {
                 :server      => '1',
                 :workstation => '1',
               },
    :result => :nodata,
    :exec   => {
                 'systemctl' => "systemctl is-enabled squid",
               },
    :data   => Hash.new,
    :test   => Proc.new {
                 this = @@results['2']['2']['13']
                 if (
# TODO Put failure case here. Expecting:
# systemctl => disabled
                    ) then
                   this[:result] = :fail
                 else
                   this[:result] = :pass
                 end
               },
  }

  # 2.2.14 Ensure SNMP Server is not enabled
  @@results['2']['2']['14'] = {
    :title  => "Ensure SNMP Server is not enabled",
    :scored => true,
    :level  => {
                 :server      => '1',
                 :workstation => '1',
               },
    :result => :nodata,
    :exec   => {
                 'systemctl' => "systemctl is-enabled snmpd",
               },
    :data   => Hash.new,
    :test   => Proc.new {
                 this = @@results['2']['2']['14']
                 if (
# TODO Put failure case here. Expecting:
# systemctl => disabled
                    ) then
                   this[:result] = :fail
                 else
                   this[:result] = :pass
                 end
               },
  }

  # 2.2.15 Ensure mail transfer agent is configured for local-only mode
  @@results['2']['2']['15'] = {
    :title  => "Ensure mail transfer agent is configured for local-only mode",
    :scored => false,
    :level  => {
                 :server      => '1',
                 :workstation => '1',
               },
    :result => :nodata,
    :exec   => {
                 'netstat' => "netstat -an | grep LIST | grep \":25[[:space:]]\"",
               },
    :data   => Hash.new,
    :test   => Proc.new {
                 this = @@results['2']['2']['15']
                 if (
# TODO Put failure case here. Expecting:
# netstat => tcp 0 0 127.0.0.1:25 0.0.0.0:* LISTEN
                    ) then
                   this[:result] = :fail
                 else
                   this[:result] = :pass
                 end
               },
  }

  # 2.2.16 Ensure NIS Server is not enabled
  @@results['2']['2']['16'] = {
    :title  => "Ensure NIS Server is not enabled",
    :scored => true,
    :level  => {
                 :server      => '1',
                 :workstation => '1',
               },
    :result => :nodata,
    :exec   => {
                 'systemctl' => "systemctl is-enabled ypserv",
               },
    :data   => Hash.new,
    :test   => Proc.new {
                 this = @@results['2']['2']['16']
                 if (
# TODO Put failure case here. Expecting:
# systemctl => disabled
                    ) then
                   this[:result] = :fail
                 else
                   this[:result] = :pass
                 end
               },
  }

  # 2.2.17 Ensure rsh server is not enabled
  @@results['2']['2']['17'] = {
    :title  => "Ensure rsh server is not enabled",
    :scored => true,
    :level  => {
                 :server      => '1',
                 :workstation => '1',
               },
    :result => :nodata,
    :exec   => {
                 'systemctl' => "systemctl is-enabled rexec.socket",
               },
    :data   => Hash.new,
    :test   => Proc.new {
                 this = @@results['2']['2']['17']
                 if (
# TODO Put failure case here. Expecting:
# systemctl => disabled
                    ) then
                   this[:result] = :fail
                 else
                   this[:result] = :pass
                 end
               },
  }

  # 2.2.18 Ensure telnet server is not enabled
  @@results['2']['2']['18'] = {
    :title  => "Ensure telnet server is not enabled",
    :scored => true,
    :level  => {
                 :server      => '1',
                 :workstation => '1',
               },
    :result => :nodata,
    :exec   => {
                 'systemctl' => "systemctl is-enabled telnet.socket",
               },
    :data   => Hash.new,
    :test   => Proc.new {
                 this = @@results['2']['2']['18']
                 if (
# TODO Put failure case here. Expecting:
# systemctl => disabled
                    ) then
                   this[:result] = :fail
                 else
                   this[:result] = :pass
                 end
               },
  }

  # 2.2.19 Ensure tftp server is not enabled
  @@results['2']['2']['19'] = {
    :title  => "Ensure tftp server is not enabled",
    :scored => true,
    :level  => {
                 :server      => '1',
                 :workstation => '1',
               },
    :result => :nodata,
    :exec   => {
                 'systemctl' => "systemctl is-enabled tftp.socket",
               },
    :data   => Hash.new,
    :test   => Proc.new {
                 this = @@results['2']['2']['19']
                 if (
# TODO Put failure case here. Expecting:
# systemctl => disabled
                    ) then
                   this[:result] = :fail
                 else
                   this[:result] = :pass
                 end
               },
  }

  # 2.2.20 Ensure rsync service is not enabled
  @@results['2']['2']['20'] = {
    :title  => "Ensure rsync service is not enabled",
    :scored => true,
    :level  => {
                 :server      => '1',
                 :workstation => '1',
               },
    :result => :nodata,
    :exec   => {
                 'systemctl' => "systemctl is-enabled rsyncd",
               },
    :data   => Hash.new,
    :test   => Proc.new {
                 this = @@results['2']['2']['20']
                 if (
# TODO Put failure case here. Expecting:
# systemctl => disabled
                    ) then
                   this[:result] = :fail
                 else
                   this[:result] = :pass
                 end
               },
  }

  # 2.2.21 Ensure talk server is not enabled
  @@results['2']['2']['21'] = {
    :title  => "Ensure talk server is not enabled",
    :scored => true,
    :level  => {
                 :server      => '1',
                 :workstation => '1',
               },
    :result => :nodata,
    :exec   => {
                 'systemctl' => "systemctl is-enabled ntalk",
               },
    :data   => Hash.new,
    :test   => Proc.new {
                 this = @@results['2']['2']['21']
                 if (
# TODO Put failure case here. Expecting:
# systemctl => disabled
                    ) then
                   this[:result] = :fail
                 else
                   this[:result] = :pass
                 end
               },
  }

  # 2.3
  @@results['2']['3'] = Hash.new

  # 2.3.1 Ensure NIS Client is not installed
  @@results['2']['3']['1'] = {
    :title  => "Ensure NIS Client is not installed",
    :scored => true,
    :level  => {
                 :server      => '1',
                 :workstation => '1',
               },
    :result => :nodata,
    :exec   => {
                 'rpm' => "rpm -q ypbind",
               },
    :data   => Hash.new,
    :test   => Proc.new {
                 this = @@results['2']['3']['1']
                 if (
# TODO Put failure case here. Expecting:
# rpm => package ypbind is not installed
                    ) then
                   this[:result] = :fail
                 else
                   this[:result] = :pass
                 end
               },
  }

  # 2.3.2 Ensure rsh client is not installed
  @@results['2']['3']['2'] = {
    :title  => "Ensure rsh client is not installed",
    :scored => true,
    :level  => {
                 :server      => '1',
                 :workstation => '1',
               },
    :result => :nodata,
    :exec   => {
                 'rpm' => "rpm -q rsh",
               },
    :data   => Hash.new,
    :test   => Proc.new {
                 this = @@results['2']['3']['2']
                 if (
# TODO Put failure case here. Expecting:
# rpm => package rsh is not installed
                    ) then
                   this[:result] = :fail
                 else
                   this[:result] = :pass
                 end
               },
  }

  # 2.3.3 Ensure talk client is not installed
  @@results['2']['3']['3'] = {
    :title  => "Ensure talk client is not installed",
    :scored => true,
    :level  => {
                 :server      => '1',
                 :workstation => '1',
               },
    :result => :nodata,
    :exec   => {
                 'rpm' => "rpm -q talk",
               },
    :data   => Hash.new,
    :test   => Proc.new {
                 this = @@results['2']['3']['3']
                 if (
# TODO Put failure case here. Expecting:
# rpm => package talk is not installed
                    ) then
                   this[:result] = :fail
                 else
                   this[:result] = :pass
                 end
               },
  }

  # 2.3.4 Ensure telnet client is not installed
  @@results['2']['3']['4'] = {
    :title  => "Ensure telnet client is not installed",
    :scored => true,
    :level  => {
                 :server      => '1',
                 :workstation => '1',
               },
    :result => :nodata,
    :exec   => {
                 'rpm' => "rpm -q telnet",
               },
    :data   => Hash.new,
    :test   => Proc.new {
                 this = @@results['2']['3']['4']
                 if (
# TODO Put failure case here. Expecting:
# rpm => package telnet is not installed
                    ) then
                   this[:result] = :fail
                 else
                   this[:result] = :pass
                 end
               },
  }

  # 2.3.5 Ensure LDAP client is not installed
  @@results['2']['3']['5'] = {
    :title  => "Ensure LDAP client is not installed",
    :scored => true,
    :level  => {
                 :server      => '1',
                 :workstation => '1',
               },
    :result => :nodata,
    :exec   => {
                 'rpm' => "rpm -q openldap-clients",
               },
    :data   => Hash.new,
    :test   => Proc.new {
                 this = @@results['2']['3']['5']
                 if (
# TODO Put failure case here. Expecting:
# rpm => package openldap-clients is not installed
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
