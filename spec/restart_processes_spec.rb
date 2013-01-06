require 'blazing-foreman/recipes/restart_processes'

describe Blazing::Recipe::RestartProcesses do

  it 'is a blazing recipe' do
    Blazing::Recipe::RestartProcesses.superclass.should be Blazing::Recipe
  end

  describe 'run' do

    before :each do
      @recipe = Blazing::Recipe::RestartProcesses.new
      @recipe.stub(:info)
    end

    it 'calls the jammit compile rake task' do
      @recipe.should_receive(:system).with("bundle exec jammit")
      @recipe.run
    end

  end

end
