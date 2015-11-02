windows_package 'gauge' do
  version   node['gauge']['version']
  source    node['gauge']['url']
  checksum  node['gauge']['checksum']
end
