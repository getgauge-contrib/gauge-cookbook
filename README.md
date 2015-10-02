Gauge Cookbook
==============
[Gauge](http://getgauge.io/) Test automation in the business language (from ThoughtWorks, Inc.)

Requirements
============

## Supported Platforms

This cookbook has been tested on the following platforms:

* CentOS
* RedHat
* Fedora
* Amazon Linux
* Oracle Linux
* Debian
* Ubuntu
* openSUSE
* SUSE

Usage
=====

Include the default recipe on a node's runlist to ensure that gauge is installed.


Resources/Providers
-------------------

### `gauge_plugin`

This LWRP provides an easy way to manage additional gauge plugins.

#### Actions

- `:install` - installs a gauge plugin
- `:remove` - removes the gauge plugin

#### Attribute Parameters

- `name` - the name of the plugin
- `user` - the user under which the plugin should be installed
- `group` - the group under which the plugin should be installed

#### Examples

Install the gauge `java` plugin

```ruby
include_recipe 'gauge'

gauge_plugin 'java' do
  user  'alice'
  group 'alice'
end
```


Remove the gauge `html-report` plugin

```ruby
gauge_plugin 'html-report' do
  user  'alice'
  group 'alice'
end
```
