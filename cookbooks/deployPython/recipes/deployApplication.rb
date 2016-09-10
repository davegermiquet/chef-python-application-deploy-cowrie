directory "#{node[:default][:directory][:work]}/#{node[:default][:directory][:git]}" do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
  recursive true
end

git "#{node[:default][:directory][:work]}/#{node[:default][:directory][:git]}" do
   repository "#{node[:default][:git][:repository]}"
   revision "#{node[:default][:git][:branch]}"
   action :sync
   user 'root'
   group 'root'
end


template "#{node[:default][:directory][:work]}/Dockerfile" do
  source 'default/Dockerfile'
end

execute 'tar up dockerFile and /root/deployment' do
	command "tar -cvf #{node[:default][:directory][:work]}/dockerfileconfig.tar -C #{node[:default][:directory][:work]} Dockerfile -C #{node[:default][:directory][:work]} #{node[:default][:directory][:git]}"
end

if node[:default][:customscript] 
   template "#{node[:default][:directory][:work]}/#{node[:default][:customscript]}" do
  	source "default/#{node[:default][:customscript]}"
   end
   execute 'tar up custom script' do
	 command "tar -rvf #{node[:default][:directory][:work]}/dockerfileconfig.tar -C #{node[:default][:directory][:work]} #{node[:default][:customscript]}"
   end

end

docker_image 'python' do
  tag 'latest'
    action :pull
end

docker_image 'dockerapplication'  do
        tag 'v0.1.0'
        source "#{node[:default][:directory][:work]}/dockerfileconfig.tar"
        action :build
end
