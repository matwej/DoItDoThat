require 'rails_helper'

RSpec.describe "Projects V1", type: :request do
  describe "GET /projects" do
    it "works! (now write some real specs)" do
      get '/v1/projects'
      expect(response).to have_http_status(200)
      expect(response.content_type).to eq Mime[:json]
    end
  end
  describe "POST /projects" do
    it 'should create project' do
      post '/v1/projects', params: {project: {title: 'repair chair', description: 'chair repair project'}}
      expect(response).to have_http_status(201)
      expect(response.content_type).to eq Mime[:json]
      expect(response.location).not_to be_nil
    end
    it 'should not create project without title' do
      post '/v1/projects', params: {project: {title: '', description: 'chair repair project'}}
      expect(response).to have_http_status(422)
      expect(response.content_type).to eq Mime[:json]
    end
  end
end
