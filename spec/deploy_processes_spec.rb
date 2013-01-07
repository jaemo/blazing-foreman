require 'blazing-foreman/recipes/deploy_processes'

describe Blazing::Recipe::DeployProcesses do

  it 'is a blazing recipe' do
    Blazing::Recipe::DeployProcesses.superclass.should be Blazing::Recipe
  end

  describe 'run' do

    before :each do
      @recipe = Blazing::Recipe::DeployProcesses.new
      @recipe.stub(:info)
    end

    it 'should call to foreman export by default' do
      @recipe.should_receive(:system).with("sudo foreman export upstart /etc/init")
      @recipe.run
    end

    it 'should include all options when passed' do
      @recipe.should_receive(:system).with("rvmsudo foreman export upstart /etc/init -f Procfile2 -a testing -u bob -d /var/www/testing -e test_env -l /var/www/testing/log -p 3000 -c web:2 -t custom")
      @recipe.run :sudo =>'rvmsudo', :app => 'testing', :user => 'bob', :procfile => 'Procfile2', :env => 'test_env', :directory => '/var/www/testing', :log => '/var/www/testing/log', :port => 3000, :concurrency => 'web:2', :template => 'custom'
    end

  end

end
