
package 'nginx'
package 'python-flask'
package 'vim'

service "nginx" do
	  action :start
end

group 'admin' do
	 action :create
end


