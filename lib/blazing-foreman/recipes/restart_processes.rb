require "blazing/recipe"
require "foreman/procfile"

class Blazing::Recipe::RestartProcesses < Blazing::Recipe

  def run(target_options = {})
    super target_options

    info "restarting processes"
    if complex_restart?
      processes.each do |process|
        restart = restart_command process
        system "#{sudo} initctl start #{application}-#{process} || #{sudo} initctl #{restart} #{application}-#{process}"
      end
    else
      system "#{sudo} initctl start #{application} || #{sudo} initctl restart #{application}"
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
    Foreman::Procfile.new(procfile).entries.keys
  end

  def sudo
    options[:sudo] || 'sudo'
  end

end
