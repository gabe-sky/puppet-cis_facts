$:.unshift '/opt/puppetlabs/puppet/cache/lib/facter/util'
require 'CIS_1_CentOS7'
require 'CIS_2_CentOS7'
require 'CIS_3_CentOS7'
require 'CIS_4_CentOS7'
require 'CIS_5_CentOS7'
require 'CIS_6_CentOS7'

Facter.add(:cis_centos7, :type => :aggregate) do
  confine :operatingsystem => 'CentOS'
  confine :operatingsystemmajrelease => '7'

  # Initialize test results
  cis_1 = CIS_1_CentOS7.new
  cis_2 = CIS_2_CentOS7.new
  cis_3 = CIS_3_CentOS7.new
  cis_4 = CIS_4_CentOS7.new
  cis_5 = CIS_5_CentOS7.new
  cis_6 = CIS_6_CentOS7.new

  ########################################
  # Show full results
  #
  results_1 = CIS_1_CentOS7.facter_full_hash
  results_2 = CIS_2_CentOS7.facter_full_hash
  results_3 = CIS_3_CentOS7.facter_full_hash
  results_4 = CIS_4_CentOS7.facter_full_hash
  results_5 = CIS_5_CentOS7.facter_full_hash
#  results_6 = CIS_6_CentOS7.facter_full_hash

  ########################################
  # Show only test result
  #
#  results_1 = CIS_1_CentOS7.facter_result_hash
#  results_2 = CIS_2_CentOS7.facter_result_hash
#  results_3 = CIS_3_CentOS7.facter_result_hash
#  results_4 = CIS_4_CentOS7.facter_result_hash
#  results_5 = CIS_5_CentOS7.facter_result_hash
#  results_6 = CIS_6_CentOS7.facter_result_hash

  ########################################
  # Show test title and result
  #
#  keys = [ :title, :result ]
#  results_1 = CIS_1_CentOS7.facter_hash(keys)
#  results_2 = CIS_2_CentOS7.facter_hash(keys)
#  results_3 = CIS_3_CentOS7.facter_hash(keys)
#  results_4 = CIS_4_CentOS7.facter_hash(keys)
#  results_5 = CIS_5_CentOS7.facter_hash(keys)
#  results_6 = CIS_6_CentOS7.facter_hash(keys)

  ########################################
  # Show custom results:
  # - :title  := test title
  # - :scored := whether or not test is scored
  # - :level  := server & workstation impact levels
  # - :result := test result
  # - :exec   := test executables
  # - :data   := test executables' output (STDOUT)
  keys = [ :title, :scored, :level, :result, :exec ]
#  results_1 = CIS_1_CentOS7.facter_hash(keys)
#  results_2 = CIS_2_CentOS7.facter_hash(keys)
#  results_3 = CIS_3_CentOS7.facter_hash(keys)
#  results_4 = CIS_4_CentOS7.facter_hash(keys)
#  results_5 = CIS_5_CentOS7.facter_hash(keys)
  results_6 = CIS_6_CentOS7.facter_hash(keys)

  # All set here, let's let Facter have it
  chunk(:one) do
    results_1
  end
  chunk(:two) do
    results_2
  end
  chunk(:three) do
    results_3
  end
  chunk(:four) do
    results_4
  end
  chunk(:five) do
    results_5
  end
  chunk(:six) do
    results_6
  end

end
