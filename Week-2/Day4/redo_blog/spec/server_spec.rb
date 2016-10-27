require "./server.rb"

require "rspec"
require "rack/test"


describe "My Web App" do
  include Rack::Test::Methods


  def app
    Sinatra::Application
  end


  it "Should load the blog page" do
    get "/"
    expect(last_response.redirect?).to be(true)
  end

   it "Should not load a page that doesn't exist" do
     get "/home"
     expect(last_response).not_to be_ok
   end

   it "should redirect from /navigation to /blog" do
      post "/navigation"
      expect(last_response.redirect?).to be(true)

  end

  



end
