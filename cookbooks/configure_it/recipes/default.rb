
include_recipe 'sudo'


execute "update_and_upgrade" do
	command "apt-get update -y"
	command "apt-get upgrade -y"
end

package 'nginx'
package 'python-flask'
package 'vim'

service "nginx" do
	  action :start
end

group 'admin' do
	 action :create
end

file '/etc/nginx/nginx.conf' do
  notifies :restart, 'service[nginx]', :delayed
end


sudo 'vagrant' do
	user 'vagrant'
	runas 'ALL'
	commands ['ALL']
	nopasswd true
end

sudo 'admin' do
	group '%admin'
	runas 'ALL'
	commands ['ALL']
	nopasswd false 
end