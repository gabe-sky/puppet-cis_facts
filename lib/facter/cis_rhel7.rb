

Facter.add(:cis_rhel7) do
  confine :osfamily => 'RedHat'
  confine :operatingsystemmajrelease => '7'

  # We'll build up this hash with all of the results, for a structured fact
  results = Hash.new

  # 1. Initial Setup
  results["1"] = Hash.new

  # 1.1 Filesystem Configuration
  results["1"]["1"] = Hash.new

  # 1.1.1 Disable unused filesystems
  results["1"]["1"]["1"] = Hash.new

  # 1.1.1.1 Ensure mounting of cramfs filesystems is disabled (Scored)
  results["1"]["1"]["1"]["1"] = {
    "title"  => "Ensure mounting of cramfs filesystems is disabled",
    "scored" => true,
    "level"  => { "server" => "1", "workstation" => "1" },
    "result" => "pass"
  }
  modprobe = Facter::Core::Execution.exec('/usr/sbin/modprobe -n -v cramfs')
  lsmod = Facter::Core::Execution.exec('/usr/sbin/lsmod | /usr/bin/grep "cramfs"')
  if ( modprobe != "install /bin/true" || lsmod != "" )
    results["1"]["1"]["1"]["1"]["result"] = "fail"
  end

  # 1.1.1.2 Ensure mounting of freevxfs filesystems is disabled (Scored)
  results["1"]["1"]["1"]["2"] = {
    "title"  => "Ensure mounting of freevxfs filesystems is disabled",
    "scored" => true,
    "level"  => { "server" => "1", "workstation" => "1" },
    "result" => "pass"
  }
  modprobe = Facter::Core::Execution.exec('/usr/sbin/modprobe -n -v freevxfs')
  lsmod = Facter::Core::Execution.exec('/usr/sbin/lsmod | /usr/bin/grep "freevxfs"')
  if ( modprobe != "install /bin/true" || lsmod != "" )
    results["1"]["1"]["1"]["2"]["result"] = "fail"
  end

  # 1.1.1.3 Ensure mounting of jffs2 filesystems is disabled (Scored)
  results["1"]["1"]["1"]["3"] = {
    "title"  => "Ensure mounting of jffs2 filesystems is disabled",
    "scored" => true,
    "level"  => { "server" => "1", "workstation" => "1" },
    "result" => "pass"
  }
  modprobe = Facter::Core::Execution.exec('/usr/sbin/modprobe -n -v jffs2')
  lsmod = Facter::Core::Execution.exec('/usr/sbin/lsmod | /usr/bin/grep "jffs2"')
  if ( modprobe != "install /bin/true" || lsmod != "" )
    results["1"]["1"]["1"]["3"]["result"] = "fail"
  end

  # 1.1.1.4 Ensure mounting of hfs filesystems is disabled (Scored)
  results["1"]["1"]["1"]["4"] = {
    "title"  => "Ensure mounting of hfs filesystems is disabled",
    "scored" => true,
    "level"  => { "server" => "1", "workstation" => "1" },
    "result" => "pass"
  }
  modprobe = Facter::Core::Execution.exec('/usr/sbin/modprobe -n -v hfs')
  lsmod = Facter::Core::Execution.exec('/usr/sbin/lsmod | /usr/bin/grep "hfs"')
  if ( modprobe != "install /bin/true" || lsmod != "" )
    results["1"]["1"]["1"]["4"]["result"] = "fail"
  end

  # 1.1.1.5 Ensure mounting of hfsplus filesystems is disabled (Scored)
  results["1"]["1"]["1"]["5"] = {
    "title"  => "Ensure mounting of hfsplus filesystems is disabled",
    "scored" => true,
    "level"  => { "server" => "1", "workstation" => "1" },
    "result" => "pass"
  }
  modprobe = Facter::Core::Execution.exec('/usr/sbin/modprobe -n -v hfsplus')
  lsmod = Facter::Core::Execution.exec('/usr/sbin/lsmod | /usr/bin/grep "hfsplus"')
  if ( modprobe != "install /bin/true" || lsmod != "" )
    results["1"]["1"]["1"]["5"]["result"] = "fail"
  end

  # 1.1.1.6 Ensure mounting of squashfs filesystems is disabled (Scored)
  results["1"]["1"]["1"]["6"] = {
    "title"  => "Ensure mounting of squashfs filesystems is disabled",
    "scored" => true,
    "level"  => { "server" => "1", "workstation" => "1" },
    "result" => "pass"
  }
  modprobe = Facter::Core::Execution.exec('/usr/sbin/modprobe -n -v squashfs')
  lsmod = Facter::Core::Execution.exec('/usr/sbin/lsmod | /usr/bin/grep "squashfs"')
  if ( modprobe != "install /bin/true" || lsmod != "" )
    results["1"]["1"]["1"]["6"]["result"] = "fail"
  end

  # 1.1.1.7 Ensure mounting of udf filesystems is disabled (Scored)
  results["1"]["1"]["1"]["7"] = {
    "title"  => "Ensure mounting of udf filesystems is disabled",
    "scored" => true,
    "level"  => { "server" => "1", "workstation" => "1" },
    "result" => "pass"
  }
  modprobe = Facter::Core::Execution.exec('/usr/sbin/modprobe -n -v udf')
  lsmod = Facter::Core::Execution.exec('/usr/sbin/lsmod | /usr/bin/grep "udf"')
  if ( modprobe != "install /bin/true" || lsmod != "" )
    results["1"]["1"]["1"]["7"]["result"] = "fail"
  end

  # 1.1.1.8 Ensure mounting of FAT filesystems is disabled (Scored)
  results["1"]["1"]["1"]["8"] = {
    "title"  => "Ensure mounting of FAT filesystems is disabled",
    "scored" => true,
    "level"  => { "server" => "1", "workstation" => "2" },
    "result" => "pass"
  }
  modprobe = Facter::Core::Execution.exec('/usr/sbin/modprobe -n -v vfat')
  lsmod = Facter::Core::Execution.exec('/usr/sbin/lsmod | /usr/bin/grep "vfat"')
  if ( modprobe != "install /bin/true" || lsmod != "" )
    results["1"]["1"]["1"]["8"]["result"] = "fail"
  end

  # 1.1.2 Ensure separate partition exists for /tmp (Scored)
  results["1"]["1"]["2"] = {
    "title"  => "Ensure separate partition exists for /tmp",
    "scored" => true,
    "level"  => { "server" => "2", "workstation" => "2" },
    "result" => "pass"
  }
  mount = Facter::Core::Execution.exec('/usr/bin/mount | grep /tmp')
  if ( mount !~ / on \/tmp type / )
    results["1"]["1"]["2"]["result"] = "fail"
  end

  # 1.1.3 Ensure nodev option set on /tmp partition (Scored)
  # (Only if /tmp is its own partition.)
  if ( results["1"]["1"]["2"]["result"] == "pass" )
    results["1"]["1"]["3"] = {
      "title"  => "Ensure nodev option set on /tmp partition",
      "scored" => true,
      "level"  => { "server" => "1", "workstation" => "1" },
      "result" => "pass"
    }
    # Reusing mount from 1.1.2
    if ( mount !~ /nodev/ )
      results["1"]["1"]["3"]["result"] = "fail"
    end
  else
    results["1"]["1"]["3"] = { "result" => "skip" }
  end

  # 1.1.4 Ensure nosuid option set on /tmp partition (Scored)
  # (Only if /tmp is its own partition.)
  if ( results["1"]["1"]["2"]["result"] == "pass" )
    results["1"]["1"]["4"] = {
      "title"  => "Ensure nosuid option set on /tmp partition",
      "scored" => true,
      "level"  => { "server" => "1", "workstation" => "1" },
      "result" => "pass"
    }
    # Reusing mount from 1.1.2
    if ( mount !~ /nosuid/ )
      results["1"]["1"]["4"]["result"] = "fail"
    end
  else
    results["1"]["1"]["4"] = { "result" => "skip" }
  end

  # 1.1.5 Ensure noexec option set on /tmp partition (Scored)
  # (Only if /tmp is its own partition.)
  if ( results["1"]["1"]["2"]["result"] == "pass" )
    results["1"]["1"]["5"] = {
      "title"  => "Ensure noexec option set on /tmp partition",
      "scored" => true,
      "level"  => { "server" => "1", "workstation" => "1" },
      "result" => "pass"
    }
    # Reusing mount from 1.1.2
    if ( mount !~ /noexec/ )
      results["1"]["1"]["5"]["result"] = "fail"
    end
  else
    results["1"]["1"]["5"] = { "result" => "skip" }
  end

  # 1.1.6 Ensure separate partition exists for /var (Scored)
  results["1"]["1"]["6"] = {
    "title"  => "Ensure separate partition exists for /var",
    "scored" => true,
    "level"  => { "server" => "2", "workstation" => "2" },
    "result" => "pass"
  }
  mount = Facter::Core::Execution.exec('/usr/bin/mount | grep /var')
  if ( mount !~ / on \/var type / )
    results["1"]["1"]["6"]["result"] = "fail"
  end

  # 1.1.7 Ensure separate partition exists for /var/tmp (Scored)
  results["1"]["1"]["7"] = {
    "title"  => "Ensure separate partition exists for /var/tmp",
    "scored" => true,
    "level"  => { "server" => "2", "workstation" => "2" },
    "result" => "pass"
  }
  mount = Facter::Core::Execution.exec('/usr/bin/mount | grep /var/tmp')
  if ( mount !~ / on \/var\/tmp type / )
    results["1"]["1"]["7"]["result"] = "fail"
  end

  # 1.1.8 Ensure nodev option set on /var/tmp partition (Scored)
  # (Only if /var/tmp is its own partition.)
  if ( results["1"]["1"]["7"]["result"] == "pass" )
    results["1"]["1"]["8"] = {
      "title"  => "Ensure nodev option set on /var/tmp partition",
      "scored" => true,
      "level"  => { "server" => "1", "workstation" => "1" },
      "result" => "pass"
    }
    # Reusing mount from 1.1.7
    if ( mount !~ /nodev/ )
      results["1"]["1"]["8"]["result"] = "fail"
    end
  else
    results["1"]["1"]["8"] = { "result" => "skip" }
  end

  # 1.1.9 Ensure nosuid option set on /var/tmp partition (Scored)
  # (Only if /var/tmp is its own partition.)
  if ( results["1"]["1"]["7"]["result"] == "pass" )
    results["1"]["1"]["9"] = {
      "title"  => "Ensure nosuid option set on /var/tmp partition",
      "scored" => true,
      "level"  => { "server" => "1", "workstation" => "1" },
      "result" => "pass"
    }
    # Reusing mount from 1.1.7
    if ( mount !~ /nosuid/ )
      results["1"]["1"]["9"]["result"] = "fail"
    end
  else
    results["1"]["1"]["9"] = { "result" => "skip" }
  end

  # 1.1.10 Ensure noexec option set on /var/tmp partition (Scored)
  # (Only if /var/tmp is its own partition.)
  if ( results["1"]["1"]["7"]["result"] == "pass" )
    results["1"]["1"]["10"] = {
      "title"  => "Ensure noexec option set on /var/tmp partition",
      "scored" => true,
      "level"  => { "server" => "1", "workstation" => "1" },
      "result" => "pass"
    }
    # Reusing mount from 1.1.7
    if ( mount !~ /noexec/ )
      results["1"]["1"]["10"]["result"] = "fail"
    end
  else
    results["1"]["1"]["10"] = { "result" => "skip" }
  end

  # 1.1.11 Ensure separate partition exists for /var/log (Scored)
  results["1"]["1"]["11"] = {
    "title"  => "Ensure separate partition exists for /var/log",
    "scored" => true,
    "level"  => { "server" => "2", "workstation" => "2" },
    "result" => "pass"
  }
  mount = Facter::Core::Execution.exec('/usr/bin/mount | grep /var/log')
  if ( mount !~ / on \/var\/log type / )
    results["1"]["1"]["11"]["result"] = "fail"
  end

  # 1.1.12 Ensure separate partition exists for /var/log/audit (Scored)
  results["1"]["1"]["12"] = {
    "title"  => "Ensure separate partition exists for /var/log/audit",
    "scored" => true,
    "level"  => { "server" => "2", "workstation" => "2" },
    "result" => "pass"
  }
  mount = Facter::Core::Execution.exec('/usr/bin/mount | grep /var/log/audit')
  if ( mount !~ / on \/var\/log\/audit type / )
    results["1"]["1"]["12"]["result"] = "fail"
  end

  # 1.1.13 Ensure separate partition exists for /home (Scored)
  results["1"]["1"]["13"] = {
    "title"  => "Ensure separate partition exists for /home",
    "scored" => true,
    "level"  => { "server" => "2", "workstation" => "2" },
    "result" => "pass"
  }
  mount = Facter::Core::Execution.exec('/usr/bin/mount | grep /home')
  if ( mount !~ / on \/home type / )
    results["1"]["1"]["13"]["result"] = "fail"
  end

  # 1.1.14 Ensure nodev option set on /home partition (Scored)
  # (Only if /home is its own partition.)
  if ( results["1"]["1"]["13"]["result"] == "pass" )
    results["1"]["1"]["14"] = {
      "title"  => "Ensure nodev option set on /home partition",
      "scored" => true,
      "level"  => { "server" => "1", "workstation" => "1" },
      "result" => "pass"
    }
    # Reusing mount from 1.1.13
    if ( mount !~ /nodev/ )
      results["1"]["1"]["14"]["result"] = "fail"
    end
  else
    results["1"]["1"]["14"] = { "result" => "skip" }
  end

  # 1.1.15 Ensure nodev option set on /dev/shm partition (Scored)
  results["1"]["1"]["15"] = {
    "title"  => "Ensure nodev option set on /dev/shm partition",
    "scored" => true,
    "level"  => { "server" => "1", "workstation" => "1" },
    "result" => "pass"
  }
  mount = Facter::Core::Execution.exec('/usr/bin/mount | grep /dev/shm')
  if ( mount !~ /nodev/ )
    results["1"]["1"]["15"]["result"] = "fail"
  end

  # 1.1.16 Ensure nosuid option set on /dev/shm partition (Scored)
  results["1"]["1"]["16"] = {
    "title"  => "Ensure nosuid option set on /dev/shm partition",
    "scored" => true,
    "level"  => { "server" => "1", "workstation" => "1" },
    "result" => "pass"
  }
  mount = Facter::Core::Execution.exec('/usr/bin/mount | grep /dev/shm')
  if ( mount !~ /nosuid/ )
    results["1"]["1"]["16"]["result"] = "fail"
  end

  # 1.1.17 Ensure noexec option set on /dev/shm partition (Scored)
  results["1"]["1"]["17"] = {
    "title"  => "Ensure noexec option set on /dev/shm partition",
    "scored" => true,
    "level"  => { "server" => "1", "workstation" => "1" },
    "result" => "pass"
  }
  mount = Facter::Core::Execution.exec('/usr/bin/mount | grep /dev/shm')
  if ( mount !~ /noexec/ )
    results["1"]["1"]["17"]["result"] = "fail"
  end

  # 1.1.18 Ensure nodev option set on removable media partitions (Not Scored)
  # 1.1.19 Ensure nosuid option set on removable media partitions (Not Scored)
  # 1.1.20 Ensure noexec option set on removable media partitions (Not Scored)
  #
  # These three guidelines are not specific enough, and require human judge-
  # ment, in order to audit them.

  # 1.1.21 Ensure sticky bit is set on all world-writable directories (Scored)
  results["1"]["1"]["21"] = {
    "title"  => "Ensure sticky bit is set on all world-writable directories",
    "scored" => true,
    "level"  => { "server" => "1", "workstation" => "1" },
    "result" => "pass"
  }
  unsticky = Facter::Core::Execution.exec('
    df --local -P | awk {"if (NR!=1) print $6"} | xargs -I "{}" find "{}" -xdev -type d \( -perm -0002 -a ! -perm -1000 \) 2>/dev/null
  ')
  if ( unsticky != nil )
    results["1"]["1"]["21"]["result"] = "fail"
  end

  # 1.1.22 Disable Automounting (Scored)
  results["1"]["1"]["22"] = {
    "title"  => "Disable Automounting",
    "scored" => true,
    "level"  => { "server" => "1", "workstation" => "2" },
    "result" => "pass"
  }
  automount = Facter::Core::Execution.exec('/usr/bin/systemctl is-enabled autofs')
  if ( automount == "enabled" )
    results["1"]["1"]["22"]["result"] = "fail"
  end

  # 1.2 Configure Software Updates
  results["1"]["2"] = Hash.new

  # 1.2.1 Ensure package manager repositories are configured (Not Scored)
  # 1.2.2 Ensure GPG keys are configured (Not Scored)
  #
  # These two guidelines are not specific enough, and require human judgement,
  # in order to audit them.

  # 1.2.3 Ensure gpgcheck is globally activated (Scored)
    results["1"]["2"]["3"] = {
    "title"  => "Ensure gpgcheck is globally activated",
    "scored" => true,
    "level"  => { "server" => "1", "workstation" => "1" },
    "result" => "pass"
  }
  gpgcheck = Facter::Core::Execution.exec('/usr/bin/grep ^gpgcheck /etc/yum.conf')
  if ( gpgcheck != "gpgcheck=1" )
    results["1"]["2"]["3"]["result"] = "fail"
  end

  # 1.3 Filesystem Integrity Checking
  results["1"]["3"] = Hash.new

  # 1.3.1 Ensure AIDE is installed (Scored)
  results["1"]["3"]["1"] = {
    "title"  => "Ensure AIDE is installed",
    "scored" => true,
    "level"  => { "server" => "1", "workstation" => "1" },
    "result" => "pass"
  }
  rpm = Facter::Core::Execution.exec('/usr/bin/rpm -q aide')
  if ( rpm !~ /^aide-/ )
    results["1"]["3"]["1"]["result"] = "fail"
  end

  # 1.3.2 Ensure filesystem integrity is regularly checked (Scored)
  results["1"]["3"]["2"] = {
    "title"  => "Ensure filesystem integrity is regularly checked",
    "scored" => true,
    "level"  => { "server" => "1", "workstation" => "1" },
    "result" => "pass"
  }
  crontab = Facter::Core::Execution.exec('/usr/bin/crontab -u root -l | grep -c aide')
  crond = Facter::Core::Execution.exec('/usr/bin/grep -r aide /etc/cron.* /etc/crontab | /usr/bin/wc -l')
  if ( crontab == "0" && crond == "0" )
    results["1"]["3"]["2"]["result"] = "fail"
  end

  # All set here, let's let Facter have it
  setcode do
    results
  end

end
