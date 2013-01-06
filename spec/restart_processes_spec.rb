require 'blazing-foreman/recipes/restart_processes'

describe Blazing::Recipe::RestartProcesses do

  it 'is a blazing recipe' do
    Blazing::Recipe::RestartProcesses.superclass.should be Blazing::Recipe
  end

  describe 'run' do

    before :each do
      @recipe = Blazing::Recipe::RestartProcesses.new(:app => 'testing')
      @recipe.stub(:info)
    end

    it 'call upstart for start or restart by default' do
      @recipe.should_receive(:system).with("sudo initctl start testing || sudo initctl restart testing")
      @recipe.run
    end

  end

end
