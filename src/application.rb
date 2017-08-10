require "bundler"
Bundler.require

class Application < Sinatra::Base
  get "/hello" do
    "World"
  end
end
