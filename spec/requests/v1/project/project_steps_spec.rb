require 'rails_helper'

RSpec.describe "Project::Steps", type: :request do
  describe "GET /project_steps" do
    it "works! (now write some real specs)" do
      get project_steps_path
      expect(response).to have_http_status(200)
    end
  end
end
