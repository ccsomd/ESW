require 'rails_helper'

RSpec.describe "Root", type: :request do
  describe "GET /" do
    it "should return 301 for unauthenticated users" do
      get root_path
      expect(response).to have_http_status(301)
    end
  end
end
