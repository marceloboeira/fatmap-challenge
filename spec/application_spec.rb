require "spec_helper"
require_relative "../src/application"

describe "Application" do
  def app
    @app ||= Application
  end

  describe "GET /hello" do
    before do
      get "/hello"
    end

    it "returns with status ok" do
      expect(last_response).to be_ok
    end

    it "returns world" do
      expect(last_response.body).to eq("World")
    end
  end
end
