require 'rails_helper'

RSpec.describe "V1::Project::Steps", type: :request do

  let!(:project) { create(:project, title: 'title', project_steps: [create(:project_step, content: 'content')]) }
  let!(:project2) { create(:project, title: 'title', project_steps: create_list(:project_step, 3)) }

  describe "GET /projects/:project_id/steps" do
    it "should return steps for particular project with id in uri" do
      get v1_project_steps_path(project)
      expect(response).to have_http_status(200)
      body = JSON.parse(response.body, symbolize_names: true)
      expect(body.size).to eq 1
      expect(body.first[:project_id]).to eq project.id
    end
  end
  describe "POST /projects/:project_id/steps" do
    it 'should create project step' do
      post "/v1/projects/#{project.id}/steps", params: {project_step: {content: 'prepare blueprints'}}
      expect(response).to have_http_status(201)
      expect(response.content_type).to eq Mime[:json]
      expect(response.location).not_to be_nil
      expect(project.reload.project_steps.count).to eq 2
    end
    it 'should not create step without content' do
      post "/v1/projects/#{project.id}/steps", params: {project_step: {content: ''}}
      expect(response).to have_http_status(422)
      expect(response.content_type).to eq Mime[:json]
      expect(project.reload.project_steps.count).to eq 1
    end
  end
  describe "PATCH /projects/:project_id/steps/:id" do
    it 'should update project step' do
      patch "/v1/projects/#{project.id}/steps/#{project.project_steps.first.id}", params: {project_step: {content: 'new content'}}
      expect(response).to have_http_status(200)
      expect(response.content_type).to eq Mime[:json]
      expect(project.project_steps.first.reload.content).to eq 'new content'
    end
    it 'should not update project title' do
      patch "/v1/projects/#{project.id}/steps/#{project.project_steps.first.id}", params: {project_step: {content: ''}}
      expect(response).to have_http_status(422)
      expect(response.content_type).to eq Mime[:json]
      expect(project.project_steps.first.content).to eq 'content'
    end
  end
  describe "DELETE /projects/:project_id/steps/:id" do
    it 'should delete particular step' do
      delete "/v1/projects/#{project.id}/steps/#{project.project_steps.first.id}"
      expect(response).to have_http_status(204)
      expect(response.content_type).to be_nil
      expect(project.project_steps.count).to eq 0
    end
  end
end
