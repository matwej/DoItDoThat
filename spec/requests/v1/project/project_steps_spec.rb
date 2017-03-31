require 'rails_helper'

RSpec.describe "V1::Project::Steps", type: :request do

  let!(:project) { create(:project, title: 'title', project_steps: [create(:project_step)]) }
  let!(:project2) { create(:project, title: 'title', project_steps: create_list(:project_step, 3)) }

  describe "GET /project_steps" do
    it "should return steps for particular project with id in uri" do
      get v1_project_steps_path(project)
      expect(response).to have_http_status(200)
      body = JSON.parse(response.body, symbolize_names: true)
      expect(body.size).to eq 1
      expect(body.first[:project_id]).to eq project.id
    end
  end
end
