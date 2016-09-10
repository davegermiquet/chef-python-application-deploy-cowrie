case node['platform']
   when "centos"
yum_repository 'dockerrepo' do
  description 'Docker Repo'
  baseurl 'https://yum.dockerproject.org/repo/main/centos/7/'
  gpgkey 'https://yum.dockerproject.org/gpg' 
  action :create
end
  when "ubuntu"
apt_repository 'docker-engine' do
  uri 'https://apt.dockerproject.org/repo'
  components ['main']
  distribution 'ubuntu-trusty'
  key '58118E89F3A912897C070ADBF76221572C52609D'
  keyserver 'p80.pool.sks-keyservers.net'
  action :add
end

end
