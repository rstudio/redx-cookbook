require 'serverspec'

set :backend, :exec

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

  #it "healthcheck passes" do
  #  expect(command("curl localhost:8082/health")).to exit_status 0
  #end

  describe command('curl localhost:8082/health') do
    it "healthcheck passes" do
      expect(subject.exit_status).to eq 0
    end
  end

end
