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

    it 'call to foreman export by default' do
      @recipe.should_receive(:system).with("sudo foreman export upstart /etc/init")
      @recipe.run
    end

  end

end
