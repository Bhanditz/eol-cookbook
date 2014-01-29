require File.dirname(__FILE__) + '/../../spec_helper'

describe 'eol-cookbook::database' do
  let(:chef_run) do
    ChefSpec::Runner.new do |node|
      node.set['mysql']['server_debian_password'] = 'secret'
      node.set['mysql']['server_root_password']   = 'secret'
      node.set['mysql']['server_repl_password']   = 'secret'
    end.converge(described_recipe)
  end

  it 'include mysql::server recipe' do
    expect(chef_run).to include_recipe('mysql::server')
  end

  it 'include database::mysql recipe' do
    expect(chef_run).to include_recipe('database::mysql')
  end

end
