require 'chefspec'
require 'chefspec/librarian'
require 'chef/application'

RSpec.configure do |config|
  config.platform = 'ubuntu'
  config.version  = '12.04'
end
