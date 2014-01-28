require File.dirname(__FILE__) + '/../../spec_helper'

describe 'eol-cookbook::default' do
  let(:chef_run) { ChefSpec::Runner.new.converge(described_recipe) }

  it 'includes apt recipe' do
    expect(chef_run).to include_recipe('apt')
  end

end
