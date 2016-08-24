default['gauge']['version']  = "0.5.0"

if platform_family?('windows')
  if node['kernel']['machine'] =~ /x86_64/
    default['gauge']['url']      = "https://github.com/getgauge/gauge/releases/download/v#{node['gauge']['version']}/gauge-#{node['gauge']['version']}-windows.x86_64.exe"
    default['gauge']['checksum'] = 'e58e7752a1d849a82d518dc1230e11d9a98f8d2b0d56fd6a2ae1ec315d63f0bc'
  else
    default['gauge']['url']      = "https://github.com/getgauge/gauge/releases/download/v#{node['gauge']['version']}/gauge-#{node['gauge']['version']}-windows.x86.exe"
    default['gauge']['checksum'] = '2247f384461d25f5e0c9f5c59f124cc05317c617e93e2d44ece84eb2440e02d7'
  end
else
  if node['kernel']['machine'] =~ /x86_64/
    default['gauge']['url']      = "https://github.com/getgauge/gauge/releases/download/v#{node['gauge']['version']}/gauge-#{node['gauge']['version']}-linux.x86_64.zip"
    default['gauge']['checksum'] = '0ccc45cf9fe614126fef3847ffc13744f2673e653782b613f3ced9f2da67bc5d'
  else
    default['gauge']['url']      = "https://github.com/getgauge/gauge/releases/download/v#{node['gauge']['version']}/gauge-#{node['gauge']['version']}-linux.x86.zip"
    default['gauge']['checksum'] = '201d181bd8e583d841c909c285fa45876339bfb970c3c0ad56597ac760704bcf'
  end
end

default['gauge']['properties']['runner_connection_timeout'] = 60000
default['gauge']['properties']['plugin_connection_timeout'] = 10000
default['gauge']['properties']['plugin_kill_timeout']       = 4000
default['gauge']['properties']['runner_request_timeout']    = 60000
