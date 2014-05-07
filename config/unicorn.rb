# Set the working application directory
# working_directory "/path/to/your/app"
working_directory "/home/deploy/ItGotWeird/current"
root = "/home/deploy/ItGotWeird/current"
# Unicorn PID file location
# pid "/path/to/pids/unicorn.pid"

pid "#{root}/tmp/pids/unicorn.pid"

# Path to logs
# stderr_path "/path/to/log/unicorn.log"
# stdout_path "/path/to/log/unicorn.log"
stderr_path "#{root}/log/unicorn.log"
stdout_path "#{root}/log/unicorn.log"

# Unicorn socket
listen "#{root}/tmp/unicorn.ItGotWeird.sock"
# Number of processes
# worker_processes 4
worker_processes 2

# Time-out
timeout 30

preload_app true

GC.copy_on_write_friendly = true if GC.respond_to?(:copy_on_write_friendly=)

before_fork do |server, worker|
ActiveRecord::Base.connection.disconnect!
##
old_pid = Rails.env.production? ? "/home/deploy/ItGotWeird/current/tmp/pids/unicorn.pid.oldbin" :
"#{root}/tmp/pids/unicorn.pid.oldbin"
if File.exists?(old_pid) && server.pid != old_pid
begin
Process.kill("QUIT", File.read(old_pid).to_i)
rescue Errno::ENOENT, Errno::ESRCH
end
end
end


after_fork do |server, worker|
ActiveRecord::Base.establish_connection

worker.user('rails', 'rails') if Process.euid == 0 && rails_env == 'production'
end

