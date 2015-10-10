include_recipe 'chocolatey'

chocolatey 'gauge' do
  version node['gauge']['version']
end
