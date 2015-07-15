
package 'nginx'
package 'python-flask'


service "nginx" do
	  action :start
end


file '/home/vagrant/motd' do
	content 'hello world'
end


group 'hola' do
	 action :create
end
