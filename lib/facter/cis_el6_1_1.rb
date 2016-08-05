# This is a set of facts that checks on CIS compliance for Enterprise Linux 6
#

Facter.add(:cis_el6_1_1) do
  confine :osfamily => 'RedHat'
  confine :operatingsystemmajrelease => '6'

  setcode do

    # Create an empty array to push any failed guidelines into.
    cis_fail = Array.new

    # 1.1.1 Create Separate Partition for /tmp (Scored)
    comply_returns = Facter::Core::Execution.exec(
     '/bin/grep "[[:space:]]/tmp[[:space:]]" /etc/fstab'
    )
    if ( comply_returns !~ /\/tmp/ )
      cis_fail.push('1.1.1 separate /tmp')
    end

    # 1.1.2 Set nodev option for /tmp Partition (Scored)
    comply_returns = Facter::Core::Execution.exec(
       '/bin/grep /tmp /etc/fstab | grep nodev'
    )
    if ( comply_returns == '' )
      cis_fail.push('1.1.2 nodev /tmp fstab')
    end
    comply_returns = Facter::Core::Execution.exec(
       '/bin/mount | grep /tmp | grep nodev'
    )
    if ( comply_returns == '' )
      cis_fail.push('1.1.2 nodev /tmp mount')
    end

    # 1.1.3 Set nosuid option for /tmp Partition (Scored)
    comply_returns = Facter::Core::Execution.exec(
       '/bin/grep /tmp /etc/fstab | grep nosuid'
    )
    if ( comply_returns == '' )
      cis_fail.push('1.1.3 nosuid /tmp fstab')
    end
    comply_returns = Facter::Core::Execution.exec(
       '/bin/mount | grep /tmp | grep nosuid'
    )
    if ( comply_returns == '' )
      cis_fail.push('1.1.3 nosuid /tmp mount')
    end

    # 1.1.4 Set noexec option for /tmp Partition (Scored)
    comply_returns = Facter::Core::Execution.exec(
       '/bin/grep /tmp /etc/fstab | grep noexec'
    )
    if ( comply_returns == '' )
      cis_fail.push('1.1.4 noexec /tmp fstab')
    end
    comply_returns = Facter::Core::Execution.exec(
       '/bin/mount | grep /tmp | grep noexec'
    )
    if ( comply_returns == '' )
      cis_fail.push('1.1.4 noexec /tmp mount')
    end

    # 1.1.5 Create Separate Partition for /var (Scored)
    # NOTE: This test is NOT EXACTLY the same as the CIS guidelines' version.
    # This version avoids matching /var/tmp and similar.  Also, the expected
    # output in the guideline says the line should have 'ext3' in it, while
    # ours is ext4.
    comply_returns = Facter::Core::Execution.exec(
       '/bin/grep "[[:space:]]/var[[:space:]]" /etc/fstab'
    )
    if ( comply_returns !~ /\/var/ )
      cis_fail.push('1.1.5 separate /var')
    end

    # 1.1.6 Bind Mount the /var/tmp directory to /tmp (Scored)
    comply_returns = Facter::Core::Execution.exec(
       '/bin/grep -e "^/tmp" /etc/fstab | grep /var/tmp'
    )
    if ( comply_returns == '' )
      cis_fail.push('1.1.6 bind mount /var/tmp fstab')
    end
    comply_returns = Facter::Core::Execution.exec(
       '/bin/mount | grep -e "^/tmp" | grep /var/tmp'
    )
    if ( comply_returns == '' )
      cis_fail.push('1.1.6 bind mount /var/tmp mount')
    end

    # 1.1.7 Create Separate Partition for /var/log (Scored)
    # NOTE: This test is NOT EXACTLY the same as the CIS guidelines' version.
    # The expected output in the guideline says the volume should be ext3 but
    # ours is ext4.
    comply_returns = Facter::Core::Execution.exec(
       '/bin/grep /var/log /etc/fstab'
    )
    if ( comply_returns !~ /\/var\/log/ )
      cis_fail.push('1.1.7 separate /var/log')
    end

    # 1.1.8 Create Separate Partition for /var/log/audit (Scored)
    # NOTE: This test is NOT EXACTLY the same as the CIS guidelines' version.
    # The expected output in the guideline says the volume should be ext3 but
    # ours is ext4.
    comply_returns = Facter::Core::Execution.exec(
       '/bin/grep /var/log/audit /etc/fstab'
    )
    if ( comply_returns !~ /\/var\/log\/audit/ )
      cis_fail.push('1.1.8 separate /var/log/audit')
    end

    # 1.1.9 Create Separate Partition for /home (Scored)
    # NOTE: This test is NOT EXACTLY the same as the CIS guidelines' version.
    # The expected output in the guideline says the volume should be ext3 but
    # ours is ext4.
    comply_returns = Facter::Core::Execution.exec(
       '/bin/grep /home /etc/fstab'
    )
    if ( comply_returns !~ /\/home/ )
      cis_fail.push('1.1.9 separate /home')
    end

    # 1.1.10 Add nodev Option to /home (Scored)
    # NOTE: This test is NOT EXACTLY the same as the CIS guidelines' version.
    # Their audit command checks /tmp, which appears to be a copy-paste bug.
    comply_returns = Facter::Core::Execution.exec(
       '/bin/grep /home /etc/fstab | grep nodev'
    )
    if ( comply_returns == '' )
      cis_fail.push('1.1.10 nodev /home fstab')
    end
    comply_returns = Facter::Core::Execution.exec(
       '/bin/mount | grep /home | grep nodev'
    )
    if ( comply_returns == '' )
      cis_fail.push('1.1.10 nodev /home mount')
    end

    # 1.1.11 Add nodev Option to Removable Media Partitions (Not Scored)
    # NOTE: This test is a BEST EFFORT based on the CIS guideline text.
    comply_returns = Facter::Core::Execution.exec(
       '/bin/grep floppy /etc/fstab | grep -v nodev'
    )
    if ( comply_returns != '' )
      cis_fail.push('1.1.11 nodev floppy')
    end
    comply_returns = Facter::Core::Execution.exec(
       '/bin/grep cdrom /etc/fstab | grep -v nodev'
    )
    if ( comply_returns != '' )
      cis_fail.push('1.1.11 nodev cdrom')
    end

    # 1.1.12 Add noexec Option to Removable Media Partitions (Not Scored)
    # NOTE: This test is a BEST EFFORT based on the CIS guideline text.
    comply_returns = Facter::Core::Execution.exec(
       '/bin/grep floppy /etc/fstab | grep -v noexec'
    )
    if ( comply_returns != '' )
      cis_fail.push('1.1.12 noexec floppy')
    end
    comply_returns = Facter::Core::Execution.exec(
       '/bin/grep cdrom /etc/fstab | grep -v noexec'
    )
    if ( comply_returns != '' )
      cis_fail.push('1.1.12 noexec cdrom')
    end

    # 1.1.13 Add nosuid Option to Removable Media Partitions (Not Scored)
    # NOTE: This test is a BEST EFFORT based on the CIS guideline text.
    comply_returns = Facter::Core::Execution.exec(
       '/bin/grep floppy /etc/fstab | grep -v nosuid'
    )
    if ( comply_returns != '' )
      cis_fail.push('1.1.13 nosuid floppy')
    end
    comply_returns = Facter::Core::Execution.exec(
       '/bin/grep cdrom /etc/fstab | grep -v nosuid'
    )
    if ( comply_returns != '' )
      cis_fail.push('1.1.13 nosuid cdrom')
    end

    # 1.1.14 Add nodev Option to /dev/shm Partition (Scored)
    comply_returns = Facter::Core::Execution.exec(
       '/bin/grep /dev/shm /etc/fstab | grep nodev'
    )
    if ( comply_returns == '' )
      cis_fail.push('1.1.14 nodev /dev/shm fstab')
    end
    comply_returns = Facter::Core::Execution.exec(
       '/bin/mount | grep /dev/shm | grep nodev'
    )
    if ( comply_returns == '' )
      cis_fail.push('1.1.14 nodev /dev/shm mount')
    end

    # 1.1.15 Add nosuid Option to /dev/shm Partition (Scored)
    comply_returns = Facter::Core::Execution.exec(
       '/bin/grep /dev/shm /etc/fstab | grep nosuid'
    )
    if ( comply_returns == '' )
      cis_fail.push('1.1.15 nosuid /dev/shm fstab')
    end
    comply_returns = Facter::Core::Execution.exec(
       '/bin/mount | grep /dev/shm | grep nosuid'
    )
    if ( comply_returns == '' )
      cis_fail.push('1.1.15 nosuid /dev/shm mount')
    end

    # 1.1.16 Add noexec Option to /dev/shm Partition (Scored)
    comply_returns = Facter::Core::Execution.exec(
       '/bin/grep /dev/shm /etc/fstab | grep noexec'
    )
    if ( comply_returns == '' )
      cis_fail.push('1.1.16 noexec /dev/shm fstab')
    end
    comply_returns = Facter::Core::Execution.exec(
       '/bin/mount | grep /dev/shm | grep noexec'
    )
    if ( comply_returns == '' )
      cis_fail.push('1.1.16 noexec /dev/shm mount')
    end

    # 1.1.17 Set Sticky Bit on All World-Writable Directories (Scored)
    # This is not something you want to do on every run, as it involves
    # a recursive `find` from / on down.
    # Recommend implementing a cron job to do this each night, and then
    # place the results in /etc/puppetlabs/facter/facts.d/cis_el6_1_1_17.txt
    # then use that fact, here to determine if you need to push anything onto
    # the cis_fail array.


    # VERDICT:
    # If nothing has been put into the cis_fail array, we're compliant.
    if ( cis_fail.empty? )
      'pass'
    else
      'fail:' + cis_fail.to_s
    end
  end
end
