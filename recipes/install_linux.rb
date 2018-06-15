yum_repository 'gauge-stable' do
  description 'Gauge stable repository'
  baseurl "http://dl.bintray.com/gauge/gauge-rpm/gauge-stable"
  gpgcheck false
  action :create
end

package 'gauge' do
  if node['gauge']['version'] == 'latest'
    action :upgrade
  elsif node['gauge']['version']
    version node['gauge']['version']
  end
end