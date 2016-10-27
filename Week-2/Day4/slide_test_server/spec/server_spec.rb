require_relative "../server.rb"
require "rspec"
require "rack/test"

describe "My Web App" do
  include Rack::Test::Methods

  def app
   Sinatra::Application
  end


  it "should load home (root) page" do
    get "/"
    expect(last_response).to be_ok
  end


  it "should not load a not existing page" do
    get "/home"
    expect(last_response).not_to be_ok
  end

  it "should load the /real_page page" do
    get "/real_page"
    expect(last_response).to be_ok
  end

  it "should redirect from /hi to /real_page" do
    
  end


end
