$:.unshift '/opt/puppetlabs/puppet/cache/lib/facter/util'
require 'CIS_1_CentOS7'

Facter.add(:cis_1_centos7) do
  confine :operatingsystem => 'CentOS'
  confine :operatingsystemmajrelease => '7'

  # Initialize test results
  cis = CIS_1_CentOS7.new

  ########################################
  # Show full results
  #
  results = CIS_1_CentOS7.facter_full_hash

  ########################################
  # Show only test result
  #
#  results = CIS_1_CentOS7.facter_result_hash

  ########################################
  # Show test title and result
  #
#  keys = [:title, :result]
#  results = CIS_1_CentOS7.facter_hash(keys)

  ########################################
  # Show custom results:
  # - :title  := test title
  # - :scored := whether or not test is scored
  # - :level  := server & workstation impact levels
  # - :result := test result
  # - :exec   := test executables
  # - :data   := test executables' output (STDOUT)
#  keys = [:title, :result, :exec, :data]
#  results = CIS_1_CentOS7.facter_hash(keys)

  # All set here, let's let Facter have it
  setcode do
    results
  end

end
