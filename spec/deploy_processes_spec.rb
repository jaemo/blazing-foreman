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

    it 'calls the jammit compile rake task' do
      @recipe.should_receive(:system).with("bundle exec jammit")
      @recipe.run
    end

  end

end
