class CIS_3_CentOS7

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
  # 3
  @@results['3'] = Hash.new

  # 3.1
  @@results['3']['1'] = Hash.new

  # 3.1.1. Ensure IP forwarding is disabled (Scored)
  @@results['3']['1']['1'] = {
    :title  => "Ensure IP forwarding is disabled",
    :scored => true,
    :level  => {
                 :server      => '1',
                 :workstation => '1',
               },
    :result => :nodata,
    :exec   => {
                 'sysctl' => "sysctl net.ipv4.ip_forward",
               },
    :data   => Hash.new,
    :test   => Proc.new {
                 this = @@results['3']['1']['1']
                 if ( this[:data]['sysctl'] != 'net.ipv4.ip_forward = 0' ) then
                   this[:result] = :fail
                 else
                   this[:result] = :pass
                 end
               },
  }

  # 3.1.2. Ensure packet redirect sending is disabled (Scored)
  @@results['3']['1']['2'] = {
    :title  => "Ensure packet redirect sending is disabled",
    :scored => true,
    :level  => {
                 :server      => '1',
                 :workstation => '1',
               },
    :result => :nodata,
    :exec   => {
                 'sysctl1' => "sysctl net.ipv4.conf.all.send_redirects",
                 'sysctl2' => "sysctl net.ipv4.conf.default.send_redirects",
               },
    :data   => Hash.new,
    :test   => Proc.new {
                 this = @@results['3']['1']['2']
                 if ( this[:data]['sysctl1'] != 'net.ipv4.conf.all.send_redirects = 0' ||
                      this[:data]['sysctl2'] != 'net.ipv4.conf.default.send_redirects = 0' ) then
                   this[:result] = :fail
                 else
                   this[:result] = :pass
                 end
               },
  }

  # 3.2
  @@results['3']['2'] = Hash.new

  # 3.2.1. Ensure source routed packets are not accepted (Scored)
  @@results['3']['2']['1'] = {
    :title  => "Ensure source routed packets are not accepted",
    :scored => true,
    :level  => {
                 :server      => '1',
                 :workstation => '1',
               },
    :result => :nodata,
    :exec   => {
                 'sysctl1' => "sysctl net.ipv4.conf.all.accept_source_route",
                 'sysctl2' => "sysctl net.ipv4.conf.default.accept_source_route",
               },
    :data   => Hash.new,
    :test   => Proc.new {
                 this = @@results['3']['2']['1']
                 if ( this[:data]['sysctl1'] != 'net.ipv4.conf.all.accept_source_route = 0' ||
                      this[:data]['sysctl2'] != 'net.ipv4.conf.default.accept_source_route = 0' ) then
                   this[:result] = :fail
                 else
                   this[:result] = :pass
                 end
               },
  }

  # 3.2.2. Ensure ICMP redirects are not accepted (Scored)
  @@results['3']['2']['2'] = {
    :title  => "Ensure ICMP redirects are not accepted",
    :scored => true,
    :level  => {
                 :server      => '1',
                 :workstation => '1',
               },
    :result => :nodata,
    :exec   => {
                 'sysctl1' => "sysctl net.ipv4.conf.all.accept_redirects",
                 'sysctl2' => "sysctl net.ipv4.conf.default.accept_redirects",
               },
    :data   => Hash.new,
    :test   => Proc.new {
                 this = @@results['3']['2']['2']
                 if ( this[:data]['sysctl1'] != 'net.ipv4.conf.all.accept_redirects = 0' ||
                      this[:data]['sysctl2'] != 'net.ipv4.conf.default.accept_redirects = 0' ) then
                   this[:result] = :fail
                 else
                   this[:result] = :pass
                 end
               },
  }

  # 3.2.3. Ensure secure ICMP redirects are not accepted (Scored)
  @@results['3']['2']['3'] = {
    :title  => "Ensure secure ICMP redirects are not accepted",
    :scored => true,
    :level  => {
                 :server      => '1',
                 :workstation => '1',
               },
    :result => :nodata,
    :exec   => {
                 'sysctl1' => "sysctl net.ipv4.conf.all.secure_redirects",
                 'sysctl2' => "sysctl net.ipv4.conf.default.secure_redirects",
               },
    :data   => Hash.new,
    :test   => Proc.new {
                 this = @@results['3']['2']['3']
                 if ( this[:data]['sysctl1'] != 'net.ipv4.conf.all.secure_redirects = 0' ||
                      this[:data]['sysctl2'] != 'net.ipv4.conf.default.secure_redirects = 0' ) then
                   this[:result] = :fail
                 else
                   this[:result] = :pass
                 end
               },
  }

  # 3.2.4. Ensure suspicious packets are logged (Scored)
  @@results['3']['2']['4'] = {
    :title  => "Ensure suspicious packets are logged",
    :scored => true,
    :level  => {
                 :server      => '1',
                 :workstation => '1',
               },
    :result => :nodata,
    :exec   => {
                 'sysctl1' => "sysctl net.ipv4.conf.all.log_martians",
                 'sysctl2' => "sysctl net.ipv4.conf.default.log_martians",
               },
    :data   => Hash.new,
    :test   => Proc.new {
                 this = @@results['3']['2']['4']
                 if ( this[:data]['sysctl1'] != 'net.ipv4.conf.all.log_martians = 1' ||
                      this[:data]['sysctl2'] != 'net.ipv4.conf.default.log_martians = 1' ) then
                   this[:result] = :fail
                 else
                   this[:result] = :pass
                 end
               },
  }

  # 3.2.5. Ensure broadcast ICMP requests are ignored (Scored)
  @@results['3']['2']['5'] = {
    :title  => "Ensure broadcast ICMP requests are ignored",
    :scored => true,
    :level  => {
                 :server      => '1',
                 :workstation => '1',
               },
    :result => :nodata,
    :exec   => {
                 'sysctl' => "sysctl net.ipv4.icmp_echo_ignore_broadcasts",
               },
    :data   => Hash.new,
    :test   => Proc.new {
                 this = @@results['3']['2']['5']
                 if ( this[:data]['sysctl'] != 'net.ipv4.icmp_echo_ignore_broadcasts = 1' ) then
                   this[:result] = :fail
                 else
                   this[:result] = :pass
                 end
               },
  }

  # 3.2.6. Ensure bogus ICMP responses are ignored (Scored)
  @@results['3']['2']['6'] = {
    :title  => "Ensure bogus ICMP responses are ignored",
    :scored => true,
    :level  => {
                 :server      => '1',
                 :workstation => '1',
               },
    :result => :nodata,
    :exec   => {
                 'sysctl' => "sysctl net.ipv4.icmp_ignore_bogus_error_responses",
               },
    :data   => Hash.new,
    :test   => Proc.new {
                 this = @@results['3']['2']['6']
                 if ( this[:data]['sysctl'] != 'net.ipv4.icmp_ignore_bogus_error_responses = 1' ) then
                   this[:result] = :fail
                 else
                   this[:result] = :pass
                 end
               },
  }

  # 3.2.7. Ensure Reverse Path Filtering is enabled (Scored)
  @@results['3']['2']['7'] = {
    :title  => "Ensure Reverse Path Filtering is enabled",
    :scored => true,
    :level  => {
                 :server      => '1',
                 :workstation => '1',
               },
    :result => :nodata,
    :exec   => {
                 'sysctl1' => "sysctl net.ipv4.conf.all.rp_filter",
                 'sysctl2' => "sysctl net.ipv4.conf.default.rp_filter",
               },
    :data   => Hash.new,
    :test   => Proc.new {
                 this = @@results['3']['2']['7']
                 if ( this[:data]['sysctl1'] != 'net.ipv4.conf.all.rp_filter = 1' ||
                      this[:data]['sysctl2'] != 'net.ipv4.conf.default.rp_filter = 1' ) then
                   this[:result] = :fail
                 else
                   this[:result] = :pass
                 end
               },
  }

  # 3.2.8. Ensure TCP SYN Cookies is enabled (Scored)
  @@results['3']['2']['8'] = {
    :title  => "Ensure TCP SYN Cookies is enabled",
    :scored => true,
    :level  => {
                 :server      => '1',
                 :workstation => '1',
               },
    :result => :nodata,
    :exec   => {
                 'sysctl' => "sysctl net.ipv4.tcp_syncookies",
               },
    :data   => Hash.new,
    :test   => Proc.new {
                 this = @@results['3']['2']['8']
                 if ( this[:data]['sysctl'] != 'net.ipv4.tcp_syncookies = 1' ) then
                   this[:result] = :fail
                 else
                   this[:result] = :pass
                 end
               },
  }

  # 3.3
  @@results['3']['3'] = Hash.new

  # 3.3.1. Ensure IPv6 router advertisements are not accepted (Scored)
  @@results['3']['3']['1'] = {
    :title  => "Ensure IPv6 router advertisements are not accepted",
    :scored => true,
    :level  => {
                 :server      => '1',
                 :workstation => '1',
               },
    :result => :nodata,
    :exec   => {
                 'sysctl1' => "sysctl net.ipv6.conf.all.accept_ra",
                 'sysctl2' => "sysctl net.ipv6.conf.default.accept_ra",
               },
    :data   => Hash.new,
    :test   => Proc.new {
                 this = @@results['3']['3']['1']
                 if ( this[:data]['sysctl1'] != 'net.ipv6.conf.all.accept_ra = 0' ||
                      this[:data]['sysctl2'] != 'net.ipv6.conf.default.accept_ra = 0' ) then
                   this[:result] = :fail
                 else
                   this[:result] = :pass
                 end
               },
  }

  # 3.3.2. Ensure IPv6 redirects are not accepted (Scored)
  @@results['3']['3']['2'] = {
    :title  => "Ensure IPv6 redirects are not accepted",
    :scored => true,
    :level  => {
                 :server      => '1',
                 :workstation => '1',
               },
    :result => :nodata,
    :exec   => {
                 'sysctl1' => "sysctl net.ipv6.conf.all.accept_redirects",
                 'sysctl2' => "sysctl net.ipv6.conf.default.accept_redirects",
               },
    :data   => Hash.new,
    :test   => Proc.new {
                 this = @@results['3']['3']['2']
                 if ( this[:data]['sysctl1'] != 'net.ipv6.conf.all.accept_redirect = 0' ||
                      this[:data]['sysctl2'] != 'net.ipv6.conf.default.accept_redirect = 0' ) then
                   this[:result] = :fail
                 else
                   this[:result] = :pass
                 end
               },
  }

  # 3.3.3. Ensure IPv6 is disabled (Not Scored)
  @@results['3']['3']['3'] = {
    :title  => "Ensure IPv6 is disabled",
    :scored => false,
    :level  => {
                 :server      => '1',
                 :workstation => '1',
               },
    :result => :nodata,
    :exec   => {
                 'modprobe' => "modprobe -c | grep ipv6",
               },
    :data   => Hash.new,
    :test   => Proc.new {
                 this = @@results['3']['3']['3']
                 if ( this[:data]['modprobe'] !~ /options ipv6 disable=1/ ) then
                   this[:result] = :fail
                 else
                   this[:result] = :pass
                 end
               },
  }

  # 3.4
  @@results['3']['4'] = Hash.new

  # 3.4.1. Ensure TCP Wrappers is installed (Scored)
  @@results['3']['4']['1'] = {
    :title  => "Ensure TCP Wrappers is installed",
    :scored => true,
    :level  => {
                 :server      => '1',
                 :workstation => '1',
               },
    :result => :nodata,
    :exec   => {
                 'rpm1' => "rpm -q tcp_wrappers",
                 'rpm2' => "rpm -q tcp_wrappers-libs",
               },
    :data   => Hash.new,
    :test   => Proc.new {
                 this = @@results['3']['4']['1']
                 if ( this[:data]['rpm1'] !~ /^tcp_wrappers-\S/ ||
                      this[:data]['rpm2'] !~ /^tcp_wrappers-libs-\S/ ) then
                   this[:result] = :fail
                 else
                   this[:result] = :pass
                 end
               },
  }

  # 3.4.2. Ensure /etc/hosts.allow is configured (Scored)
  @@results['3']['4']['2'] = {
    :title  => "Ensure /etc/hosts.allow is configured",
    :scored => true,
    :level  => {
                 :server      => '1',
                 :workstation => '1',
               },
    :result => :nodata,
    :exec   => {
                 'cat' => "cat /etc/hosts.allow",
               },
    :data   => Hash.new,
    :test   => Proc.new {
                 this = @@results['3']['4']['2']
                 this[:result] = :skip
               },
  }

  # 3.4.3. Ensure /etc/hosts.deny is configured (Scored)
  @@results['3']['4']['3'] = {
    :title  => "Ensure /etc/hosts.deny is configured",
    :scored => true,
    :level  => {
                 :server      => '1',
                 :workstation => '1',
               },
    :result => :nodata,
    :exec   => {
                 'cat' => "cat /etc/hosts.deny",
               },
    :data   => Hash.new,
    :test   => Proc.new {
                 this = @@results['3']['4']['3']
                 if ( this[:data]['cat'] != 'ALL: ALL' ) then
                   this[:result] = :fail
                 else
                   this[:result] = :pass
                 end
               },
  }

  # 3.4.4. Ensure permissions on /etc/hosts.allow are configured (Scored)
  @@results['3']['4']['4'] = {
    :title  => "Ensure permissions on /etc/hosts.allow are configured",
    :scored => true,
    :level  => {
                 :server      => '1',
                 :workstation => '1',
               },
    :result => :nodata,
    :exec   => {
                 'stat' => "stat /etc/hosts.allow",
               },
    :data   => Hash.new,
    :test   => Proc.new {
                 this = @@results['3']['4']['4']
                 if ( this[:data]['stat'] !~ /Access:\s+\(0644\/-rw-r--r--\)\s+Uid:\s+\(\s+0\/\s+root\)\s+Gid:\s+\(\s+0\/\s+root\)/
                    ) then
                   this[:result] = :fail
                 else
                   this[:result] = :pass
                 end
               },
  }

  # 3.4.5. Ensure permissions on /etc/hosts.deny are 644 (Scored)
  @@results['3']['4']['5'] = {
    :title  => "Ensure permissions on /etc/hosts.deny are 644",
    :scored => true,
    :level  => {
                 :server      => '1',
                 :workstation => '1',
               },
    :result => :nodata,
    :exec   => {
                 'stat' => "stat /etc/hosts.deny",
               },
    :data   => Hash.new,
    :test   => Proc.new {
                 this = @@results['3']['4']['5']
                 if ( this[:data]['stat'] !~ /Access:\s+\(0644\/-rw-r--r--\)\s+Uid:\s+\(\s+0\/\s+root\)\s+Gid:\s+\(\s+0\/\s+root\)/
                    ) then
                   this[:result] = :fail
                 else
                   this[:result] = :pass
                 end
               },
  }

  # 3.5
  @@results['3']['5'] = Hash.new

  # 3.5.1. Ensure DCCP is disabled (Not Scored)
  @@results['3']['5']['1'] = {
    :title  => "Ensure DCCP is disabled",
    :scored => false,
    :level  => {
                 :server      => '1',
                 :workstation => '1',
               },
    :result => :nodata,
    :exec   => {
                 'modprobe' => "modprobe -n -v dccp",
                 'lsmod'    => "lsmod | grep dccp",
               },
    :data   => Hash.new,
    :test   => Proc.new {
                 this = @@results['3']['5']['1']
                 if ( this[:data]['modprobe'] != 'install /bin/true' ||
                      this[:data]['lsmod'] != '' ) then
                   this[:result] = :fail
                 else
                   this[:result] = :pass
                 end
               },
  }

  # 3.5.2. Ensure SCTP is disabled (Not Scored)
  @@results['3']['5']['2'] = {
    :title  => "Ensure SCTP is disabled",
    :scored => false,
    :level  => {
                 :server      => '1',
                 :workstation => '1',
               },
    :result => :nodata,
    :exec   => {
                 'modprobe' => "modprobe -n -v sctp",
                 'lsmod' => "lsmod | grep sctp",
               },
    :data   => Hash.new,
    :test   => Proc.new {
                 this = @@results['3']['5']['2']
                 if ( this[:data]['modprobe'] != 'install /bin/true' ||
                      this[:data]['lsmod'] != '' ) then
                   this[:result] = :fail
                 else
                   this[:result] = :pass
                 end
               },
  }

  # 3.5.3. Ensure RDS is disabled (Not Scored)
  @@results['3']['5']['3'] = {
    :title  => "Ensure RDS is disabled",
    :scored => false,
    :level  => {
                 :server      => '1',
                 :workstation => '1',
               },
    :result => :nodata,
    :exec   => {
                 'modprobe' => "modprobe -n -v rds",
                 'lsmod' => "lsmod | grep rds",
               },
    :data   => Hash.new,
    :test   => Proc.new {
                 this = @@results['3']['5']['3']
                 if ( this[:data]['modprobe'] != 'install /bin/true' ||
                      this[:data]['lsmod'] != '' ) then
                   this[:result] = :fail
                 else
                   this[:result] = :pass
                 end
               },
  }

  # 3.5.4. Ensure TIPC is disabled (Not Scored)
  @@results['3']['5']['4'] = {
    :title  => "Ensure TIPC is disabled",
    :scored => false,
    :level  => {
                 :server      => '1',
                 :workstation => '1',
               },
    :result => :nodata,
    :exec   => {
                 'modprobe' => "modprobe -n -v tipc",
                 'lsmod' => "lsmod | grep tipc",
               },
    :data   => Hash.new,
    :test   => Proc.new {
                 this = @@results['3']['5']['4']
                 if ( this[:data]['modprobe'] != 'install /bin/true' ||
                      this[:data]['lsmod'] != '' ) then
                   this[:result] = :fail
                 else
                   this[:result] = :pass
                 end
               },
  }

  # 3.6
  @@results['3']['6'] = Hash.new

  # 3.6.1. Ensure iptables is installed (Scored)
  @@results['3']['6']['1'] = {
    :title  => "Ensure iptables is installed",
    :scored => true,
    :level  => {
                 :server      => '1',
                 :workstation => '1',
               },
    :result => :nodata,
    :exec   => {
                 'rpm' => "rpm -q iptables",
               },
    :data   => Hash.new,
    :test   => Proc.new {
                 this = @@results['3']['6']['1']
                 if ( this[:data]['rpm'] !~ /^iptables-\S/ ) then
                   this[:result] = :fail
                 else
                   this[:result] = :pass
                 end
               },
  }

  # 3.6.2. Ensure default deny firewall policy (Scored)
  @@results['3']['6']['2'] = {
    :title  => "Ensure default deny firewall policy",
    :scored => true,
    :level  => {
                 :server      => '1',
                 :workstation => '1',
               },
    :result => :nodata,
    :exec   => {
                 'iptables' => "iptables -L",
               },
    :data   => Hash.new,
    :test   => Proc.new {
                 this = @@results['3']['6']['2']
                 if ( this[:data]['iptables'] !~ /Chain INPUT \(policy DROP\)/   ||
                      this[:data]['iptables'] !~ /Chain FORWARD \(policy DROP\)/ ||
                      this[:data]['iptables'] !~ /Chain OUTPUT \(policy DROP\)/ ) then
                   this[:result] = :fail
                 else
                   this[:result] = :pass
                 end
               },
  }

  # 3.6.3. Ensure loopback traffic is configured (Scored)
  @@results['3']['6']['3'] = {
    :title  => "Ensure loopback traffic is configured",
    :scored => true,
    :level  => {
                 :server      => '1',
                 :workstation => '1',
               },
    :result => :nodata,
    :exec   => {
                 'iptables1' => "iptables -L INPUT -v -n",
                 'iptables2' => "iptables -L OUTPUT -v -n",
               },
    :data   => Hash.new,
    :test   => Proc.new {
                 this = @@results['3']['6']['3']
                 if ( this[:data]['iptables1'] !~ /\s+\d+\s+\d+\s+ACCEPT\s+all\s+--\s+lo\s+\*\s+0\.0\.0\.0\/0\s+0\.0\.0\.0\/0/ ||
                      this[:data]['iptables1'] !~ /\s+\d+\s+\d+\s+DROP\s+all\s+--\s+\*\s+\*\s+127\.0\.0\.0\/8\s+0\.0\.0\.0\/0/ ||
                      this[:data]['iptables2'] !~ /\s+\d+\s+\d+\s+ACCEPT\s+all\s+--\s+lo\s+\*\s+0\.0\.0\.0\/0\s+0\.0\.0\.0\/0/ ) then
                   this[:result] = :fail
                 else
                   this[:result] = :pass
                 end
               },
  }

  # 3.6.4. Ensure outbound and established connections are configured (Not Scored)
  @@results['3']['6']['4'] = {
    :title  => "Ensure outbound and established connections are configured",
    :scored => false,
    :level  => {
                 :server      => '1',
                 :workstation => '1',
               },
    :result => :nodata,
    :exec   => {
                 'iptables' => "iptables -L -v -n",
               },
    :data   => Hash.new,
    :test   => Proc.new {
                 this = @@results['3']['6']['4']
                 this[:result] = :skip
               },
  }

  # 3.6.5. Ensure firewall rules exist for all open ports (Scored)
  @@results['3']['6']['5'] = {
    :title  => "Ensure firewall rules exist for all open ports",
    :scored => true,
    :level  => {
                 :server      => '1',
                 :workstation => '1',
               },
    :result => :nodata,
    :exec   => {
                 'netstat'  => "netstat -ln",
                 'iptables' => "iptables -L -v -n",
               },
    :data   => Hash.new,
    :test   => Proc.new {
                 this = @@results['3']['6']['5']
                 ports = Array.new
                 netstat_data = this[:data]['netstat'].to_s
                 netstat_data.split("\n").each do
                   |line|
                   if ( line =~ /(?<proto>[a-z]+)\s+\d+\s+\d+\s+\d+\.\d+.\d+.\d+:(?<port>\d+)\s\.+LISTEN/ ) then
                     ports.push "#{proto} dpt:#{port}"
                   end
                 end
                 this[:result] = :pass
                 ports.each do
                   |search_string|
                   this[:result] = :fail unless search_string =~ /#{Regex.escape search_string}/
                 end
               },
  }

  # 3.7. Ensure wireless interfaces are disabled (Not Scored)
  @@results['3']['7'] = {
    :title  => "Ensure wireless interfaces are disabled",
    :scored => false,
    :level  => {
                 :server      => '1',
                 :workstation => '2',
               },
    :result => :nodata,
    :exec   => {
                 'ip' => "ip link show up",
                 'iwconfi' => "iwconfig",
               },
    :data   => Hash.new,
    :test   => Proc.new {
                 this = @@results['3']['7']
                 this[:result] = :skip
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
