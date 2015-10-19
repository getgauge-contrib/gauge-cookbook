# gauge 0.2.1 is not available for windows, yet!
if platform_family?('windows')
  default['gauge']['version']  = "0.2.0"
else
  default['gauge']['version']  = "0.2.1"
end

if %w(redhat centos scientific fedora amazon oracle debian ubuntu suse opensuse).include?(node['platform'])
  if node['kernel']['machine'] =~ /x86_64/
    default['gauge']['url']      = "https://github.com/getgauge/gauge/releases/download/v#{node['gauge']['version']}/gauge-#{node['gauge']['version']}-linux.x86_64.zip"
    default['gauge']['checksum'] = '34261c51b47089ff673370c54f1f6d14034356007531119b5f6c423d08813be8'
  else
    default['gauge']['url']      = "https://github.com/getgauge/gauge/releases/download/v#{node['gauge']['version']}/gauge-#{node['gauge']['version']}-linux.x86.zip"
    default['gauge']['checksum'] = 'a44fb67a96f5d26809b1261c66a69237e4491660a88ee8a3d49f033ae9a03928'
  end
end
