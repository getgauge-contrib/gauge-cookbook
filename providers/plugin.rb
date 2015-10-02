action :install do
  execute "gauge --install #{new_resource.name}" do
    user  new_resource.user
    group new_resource.group
    environment ({ 'HOME' => node['etc']['passwd'][new_resource.user]['dir'], 'USER' => new_resource.user })
  end
end

action :remove do
  directory ::File.join(node['etc']['passwd'][new_resource.user]['dir'], '.gauge', 'plugins', new_resource.name) do
    action    :delete
    recursive true
  end
end
