include Chef::Mixin::ShellOut

action :install do
  existing_version = existing_plugin_version(new_resource)
  resource_name = "install gauge plugin #{new_resource.name}#{(" v" << new_resource.version) if new_resource.version}"

  install_command = "gauge --install #{new_resource.name}"

  if new_resource.version
    install_command << " --plugin-version #{new_resource.version}"

    if existing_version && existing_version != new_resource.version
      remove_plugin(new_resource)
    end
  end

  if platform_family?('windows')
    chocolatey 'wget'
    ruby_block resource_name do
      block do
        shell_out!(install_command, shellout_options(new_resource))
        new_resource.updated_by_last_action(true)
      end

      not_if { ::File.exist?(plugin_dir(new_resource)) }
    end
  else
    execute_resource = execute resource_name do
      command install_command
      user  new_resource.user
      group new_resource.group
      environment ({
                     'HOME' => node['etc']['passwd'][new_resource.user]['dir'],
                     'USER' => new_resource.user
      })
      creates plugin_dir(new_resource)
    end

    new_resource.updated_by_last_action(execute_resource.updated_by_last_action?)
  end
end

action :remove do
  remove_plugin(new_resource)
end


def plugin_dir(new_resource)
  if platform_family?('windows')
    "C:\\Users\\#{new_resource.user}\\AppData\\Roaming\\gauge\\plugins\\#{new_resource.name}"
  else
    ::File.join(node['etc']['passwd'][new_resource.user]['dir'], '.gauge', 'plugins', new_resource.name)
  end
end

def remove_plugin(new_resource)
  to_remove = plugin_dir(new_resource)

  directory_resource = directory to_remove do
    action    :delete
    recursive true
  end

  new_resource.updated_by_last_action(directory_resource.updated_by_last_action?)
end

def shellout_options(new_resource)
  opts = {user: new_resource.user, group: new_resource.group}

  # windows needs a password, linux needs HOME and USER to be forced
  if platform_family?('windows')
    opts.merge!(password:  new_resource.password)
  else
    opts.merge!(env: {
                  'HOME' => node['etc']['passwd'][new_resource.user]['dir'],
                  'USER' => new_resource.user
    })
  end

  opts
end

def existing_plugin_version(new_resource)
  version_stdout = shell_out!('gauge --version', shellout_options(new_resource)).stdout
  if version_stdout =~ (/^#{new_resource.name} \((.*)\)/)
    $1
  else
    nil
  end
end
