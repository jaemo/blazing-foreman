require 'blazing/recipe'
require 'active_support/core_ext/object/blank'

class Blazing::Recipe::DeployProcesses < Blazing::Recipe

  def initialize(options={})
    super
    @options.merge! :format => 'upstart', :location => '/etc/init'
  end

  def run(target_options = {})
    super target_options

    info 'deploying processes'
    system "#{sudo} foreman export #{arguments}"
  end

  private

  def arguments
    options.delete_if {|k, v| v.blank?}
    args = ["#{options[:format]} #{options[:location]}"]
    args << "-f #{options[:procfile]}" if options[:procfile]
    args << "-a #{options[:app]}" if options[:app]
    args << "-u #{options[:user]}" if options[:user]
    args << "-d #{options[:directory]}" if options[:directory]
    args << "-e #{options[:env]}" if options[:env]
    args << "-l #{options[:log]}" if options[:log]
    args << "-p #{options[:port]}" if options[:port]
    args << "-c #{options[:concurrency]}" if options[:concurrency]
    args << "-t #{options[:template]}" if options[:template]
    args.join(' ')
  end

  def sudo
    options[:sudo] || 'sudo'
  end

end
