# updating/upgrading the OS.
execute "update_and_upgrade" do
	command "apt-get update -y"
	command "apt-get upgrade -y"
end

# installing nginx, flask and vim.
package 'nginx'
package 'python-flask'
package 'vim'

# starting nginx.
service "nginx" do
	  action :start
end

# creating the admin group.
group 'admin' do
	 action :create
end

file '/etc/nginx/nginx.conf' do
  notifies :restart, 'service[nginx]', :delayed
end

# The vagrant user is allowed passwordless sudo access.
sudo 'vagrant' do
	user 'vagrant'
	runas 'ALL'
	commands ['ALL']
	nopasswd true
end

# Members of admin are allowed sudo access with password.
sudo 'admin' do
	group '%admin'
	runas 'ALL'
	commands ['ALL']
	nopasswd false 
end
