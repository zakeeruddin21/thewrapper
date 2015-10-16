#
# Cookbook Name:: thewrapper
# Recipe:: default
#
# Copyright (C) 2015 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#




directory '/home/apps'

include_recipe 'lwrpsample::default'

begin
  r = resources(:template => 'sample.rb')
  r.cookbook('thewrapper')
  r.path('/home/apps/sample.rb')
  r.source('sample1.rb.erb')
  r.mode 0775
#rescue Chef::Exceptions::ResourceNotFound
 # Chef::Log.warn "could not find template /home/apps/sample.rb to modify"
end


Chef::Log.warn "********************************"

cmd = Mixlib::ShellOut.new("cat /home/apps/sample.rb")
cmd.run_command
cmd.error!
var = cmd.stdout
Chef::Log.warn "************#{var}********************"

application_name = 'merchandiselookup'

node.default['merchandiselookup']['webapp_dir'] = '/home/apps'

Chef::Log.warn "application_name"
Chef::Log.warn "#{node[application_name]['webapp_dir']}/#{application_name}/app/js/metadata.js"

#rewind :template => "sample.rb" do
#  path "/home/apps/sample.rb"
#  source "sample1.rb.erb"
#  cookbook_name "thewrapper"
#end

#unwind "template[sample.rb]"

#template "sample.rb" do
#  path "/home/apps/sample.rb"
#  source "sample1.rb.erb"
#  cookbook_name ''
#end







#resources("template[/home/apps/").cookbook 'acmeco-postgresql'