require "blazing/recipe"
require "foreman/procfile"

class Blazing::Recipe::RestartProcesses < Blazing::Recipe

  def run(target_options = {})
    super target_options

    info "restarting processes"
    if complex_restart?
      processes.each do |process|
        restart = restart_command process
        system "#{sudo} service #{application}-#{process} start  || #{sudo} service #{application}-#{process} #{restart}"
      end
    else
      system "#{sudo} service #{application} start  || #{sudo} service #{application} restart"
    end
  end

  private

  def application
    options[:app] || pwd
  end

  def pwd
    Dir.pwd.split('/').last
  end

  def complex_restart?
    !options[:reload].nil?
  end

  def restart_command(process)
    options[:reload].include?(process) ? "reload" : "restart"
  end

  def procfile
    options[:procfile] || "Procfile"
  end

  def processes
    Foreman::Procfile.new(procfile).entries{}.collect {|entry| entry.first }
  end

  def sudo
    options[:sudo] || 'sudo'
  end

end
