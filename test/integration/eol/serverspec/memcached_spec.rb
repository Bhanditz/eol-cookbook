require 'serverspec'
require 'chefspec'

include Serverspec::Helper::Exec
include Serverspec::Helper::DetectOS

RSpec.configure do |c|
  c.before :all do
    c.path = '/sbin:/usr/sbin'
  end
end

describe "Memcached Daemon" do

  it "is listening on port 11211" do
    expect(port(11211)).to be_listening
  end

  it "has a running service of memcached" do
    expect(service("memcached")).to be_running
  end


end
