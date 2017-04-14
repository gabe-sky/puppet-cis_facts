# This file implements a structured fact, that indicates the compliance of
# RedHat 6 machines with some of the CIS benchmarks (v2.0.2), as a proof of
# concept.
#
# For this demonstration -- representing just an hour of development time -- we
# chose to implement checks of some of the network-related CIS benchmarks.

Facter.add(:cis_rhel6) do
  confine :osfamily => 'RedHat'
  confine :operatingsystemmajrelease => '6'

  # We'll build up this hash with all of the results, for a structured fact
  results = Hash.new

  # 3. Network Configuration
  results["3"] = Hash.new

  # 3.1 Network Parameters (Host Only)
  results["3"]["1"] = Hash.new

  # 3.1.1 Ensure IP forwarding is disabled (Scored)
  results["3"]["1"]["1"] = {
    "title"  => "Ensure IP forwarding is disabled",
    "scored" => true,
    "level"  => { "server" => "1", "workstation" => "1" },
    "result" => "pass"
  }
  check = Facter::Core::Execution.exec('/sbin/sysctl net.ipv4.ip_forward')
  if ( check != "net.ipv4.ip_forward = 0" )
    results["3"]["1"]["1"]["result"] = "fail"
  end

  # 3.1.2 Ensure packet redirect sending is disabled (Scored)
  results["3"]["1"]["2"] = {
    "title"  => "Ensure packet redirect sending is disabled",
    "scored" => true,
    "level"  => { "server" => "1", "workstation" => "1" },
    "result" => "pass"
  }
  check = Facter::Core::Execution.exec('/sbin/sysctl net.ipv4.conf.all.send_redirects')
  check2 = Facter::Core::Execution.exec('/sbin/sysctl net.ipv4.conf.default.send_redirects')
  if ( check != "net.ipv4.conf.all.send_redirects = 0" ||
      check2 != "net.ipv4.conf.default.send_redirects = 0" )
    results["3"]["1"]["2"]["result"] = "fail"
  end

  # 3.2 Network Parameters (Host and Router)
  results["3"]["2"] = Hash.new

  # 3.2.1 Ensure source routed packets are not accepted (Scored)
  results["3"]["2"]["1"] = {
    "title"  => "Ensure source routed packets are not accepted (Scored)",
    "scored" => true,
    "level"  => { "server" => "1", "workstation" => "1" },
    "result" => "pass"
  }
  check = Facter::Core::Execution.exec('/sbin/sysctl net.ipv4.conf.all.accept_source_route')
  check2 = Facter::Core::Execution.exec('/sbin/sysctl net.ipv4.conf.default.accept_source_route')
  if ( check != "net.ipv4.conf.all.accept_source_route = 0" ||
      check2 != "net.ipv4.conf.default.accept_source_route = 0" )
    results["3"]["2"]["1"]["result"] = "fail"
  end

  # 3.2.2 Ensure ICMP redirects are not accepted (Scored)
  results["3"]["2"]["2"] = {
    "title"  => "Ensure ICMP redirects are not accepted (Scored)",
    "scored" => true,
    "level"  => { "server" => "1", "workstation" => "1" },
    "result" => "pass"
  }
  check = Facter::Core::Execution.exec('/sbin/sysctl net.ipv4.conf.all.accept_redirects')
  check2 = Facter::Core::Execution.exec('/sbin/sysctl net.ipv4.conf.default.accept_redirects')
  if ( check != "net.ipv4.conf.all.accept_redirects = 0" ||
      check2 != "net.ipv4.conf.default.accept_redirects = 0" )
    results["3"]["2"]["2"]["result"] = "fail"
  end

  # 3.2.3 Ensure secure ICMP redirects are not accepted (Scored)
  results["3"]["2"]["3"] = {
    "title"  => "Ensure secure ICMP redirects are not accepted (Scored)",
    "scored" => true,
    "level"  => { "server" => "1", "workstation" => "1" },
    "result" => "pass"
  }
  check = Facter::Core::Execution.exec('/sbin/sysctl net.ipv4.conf.all.secure_redirects')
  check2 = Facter::Core::Execution.exec('/sbin/sysctl net.ipv4.conf.default.secure_redirects')
  if ( check != "net.ipv4.conf.all.secure_redirects = 0" ||
      check2 != "net.ipv4.conf.default.secure_redirects = 0" )
    results["3"]["2"]["3"]["result"] = "fail"
  end

  # 3.2.4 Ensure suspicious packets are logged (Scored)
  results["3"]["2"]["4"] = {
    "title"  => "Ensure suspicious packets are logged (Scored)",
    "scored" => true,
    "level"  => { "server" => "1", "workstation" => "1" },
    "result" => "pass"
  }
  check = Facter::Core::Execution.exec('/sbin/sysctl net.ipv4.conf.all.log_martians')
  check2 = Facter::Core::Execution.exec('/sbin/sysctl net.ipv4.conf.default.log_martians')
  if ( check != "net.ipv4.conf.all.log_martians = 1" ||
      check2 != "net.ipv4.conf.default.log_martians = 1" )
    results["3"]["2"]["4"]["result"] = "fail"
  end

  # 3.2.5 Ensure broadcast ICMP requests are ignored
  results["3"]["2"]["5"] = {
    "title"  => "Ensure broadcast ICMP requests are ignored",
    "scored" => true,
    "level"  => { "server" => "1", "workstation" => "1" },
    "result" => "pass"
  }
  check = Facter::Core::Execution.exec('/sbin/sysctl net.ipv4.icmp_echo_ignore_broadcasts')
  if ( check != "net.ipv4.icmp_echo_ignore_broadcasts = 1" )
    results["3"]["2"]["5"]["result"] = "fail"
  end

  # 3.2.6 Ensure bogus ICMP responses are ignored (Scored)
  results["3"]["2"]["6"] = {
    "title"  => "Ensure bogus ICMP responses are ignored (Scored)",
    "scored" => true,
    "level"  => { "server" => "1", "workstation" => "1" },
    "result" => "pass"
  }
  check = Facter::Core::Execution.exec('/sbin/sysctl net.ipv4.icmp_ignore_bogus_error_responses')
  if ( check != "net.ipv4.icmp_ignore_bogus_error_responses = 1" )
    results["3"]["2"]["6"]["result"] = "fail"
  end

  # 3.2.7 Ensure Reverse Path Filtering is enabled (Scored)
  results["3"]["2"]["7"] = {
    "title"  => "Ensure Reverse Path Filtering is enabled (Scored)",
    "scored" => true,
    "level"  => { "server" => "1", "workstation" => "1" },
    "result" => "pass"
  }
  check = Facter::Core::Execution.exec('/sbin/sysctl net.ipv4.conf.all.rp_filter')
  check2 = Facter::Core::Execution.exec('/sbin/sysctl net.ipv4.conf.default.rp_filter')
  if ( check != "net.ipv4.conf.all.rp_filter = 1" ||
      check2 != "net.ipv4.conf.default.rp_filter = 1" )
    results["3"]["2"]["7"]["result"] = "fail"
  end

  # 3.2.8 Ensure TCP SYN Cookies is enabled (Scored)
  results["3"]["2"]["8"] = {
    "title"  => "Ensure TCP SYN Cookies is enabled (Scored)",
    "scored" => true,
    "level"  => { "server" => "1", "workstation" => "1" },
    "result" => "pass"
  }
  check = Facter::Core::Execution.exec('/sbin/sysctl net.ipv4.tcp_syncookies')
  if ( check != "net.ipv4.tcp_syncookies = 1" )
    results["3"]["2"]["8"]["result"] = "fail"
  end

  setcode do
    results
  end

end
