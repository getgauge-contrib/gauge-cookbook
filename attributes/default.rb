default['gauge']['version']  = "0.1.7"

if %w(redhat centos scientific fedora amazon oracle debian ubuntu suse opensuse).include?(node['platform'])
  if node['kernel']['machine'] =~ /x86_64/
    default['gauge']['url']      = "https://github.com/getgauge/gauge/releases/download/v#{node['gauge']['version']}/gauge-#{node['gauge']['version']}-linux.x86_64.zip"
    default['gauge']['checksum'] = 'd117b1f480ad899bfedeef4931e94f37617da27087b887d4ad7f7aef981bd51b'
  else
    default['gauge']['url']      = "https://github.com/getgauge/gauge/releases/download/v#{node['gauge']['version']}/gauge-#{node['gauge']['version']}-linux.x86.zip"
    default['gauge']['checksum'] = 'cbe4545747a432dcc8ad134f01e11332b89ff63756bd1c37e1e859d3a6f0688a'
  end
end
