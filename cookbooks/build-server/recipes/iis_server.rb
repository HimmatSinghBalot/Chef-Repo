#
# Cookbook:: build-server
# Recipe:: iis_server
#
# Copyright:: 2017, The Authors, All Rights Reserved.
dsc_script 'Web-Server' do
    code <<-EOH
    WindowsFeature InstallWebServer
    {
        Name = "Web-Server"
        Ensure = "Present"
    } 
    EOH
end
# Install IIS Server Management Console

dsc_script 'Web-Mgmt-Console' do
    code <<-EOH
    WindowsFeature InstallIISConsole
    {
        Name = "Web-Mgmt-Console"
        Ensure = "Present"
    } 
    EOH
end
