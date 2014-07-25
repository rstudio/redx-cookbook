require 'serverspec'

include Serverspec::Helper::Exec
include Serverspec::Helper::DetectOS

RSpec.configure do |c|
  c.before :all do
    c.path = '/sbin:/usr/sbin'
  end
end

describe "Redx Service" do

  it "has a running service of nginx" do
    expect(service("nginx")).to be_running
  end

  %w(
    8080
    8081
    8082
  ).each do |nginx_port|
    it "is listening on port #{nginx_port}" do
      expect(port(nginx_port)).to be_listening
    end
  end

  it "healthcheck passes" do
    expect(command("curl localhost:8082/health")).to return_exit_status 0
  end

end
