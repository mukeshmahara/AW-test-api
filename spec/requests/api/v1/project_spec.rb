require 'rails_helper'

RSpec.describe "Api::V1::Projects", type: :request do
  
  let(:user) { create(:user) }
  let(:project) { create(:project, user_id: user.id) }
  let!(:token) {generate_jwt_token(user)}

  describe "GET projects#index" do
    
    before do
      FactoryBot.create_list(:project, 10, user_id: user.id)
      get '/api/v1/projects'
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "return all the projects" do
      # json_response = JSON.parse(response.body)
      expect(json.values.first.count).to eq(10)
    end
  end

  describe "POST project#create" do

    before do
      # FactoryBot.create(:project, user_id: user.id)
      post '/api/v1/projects', params: {
        projects: {
          title: "",
          description: "",
          location: "",
        }
      }
    end

    context "unauthorized user" do
      it 'return response status  401' do
        expect(response).to have_http_status(:unauthorized)
      end
    end

    context "authorized user" do
      before do
        post '/api/v1/projects',
         params: {
          project: {
            title: "Earch",
            description: " Our planet",
            location: "SolarSystem",
          }
        }, headers:{Authorization: token}
      end
      
      it 'return response status 201' do
        expect(response).to have_http_status(:success)
      end
    end
  end

  describe "Get project/:id" do
    let!(:project) {FactoryBot.create(:project, user_id: user.id)}
    
    context "user" do
      before do
        get "/api/v1/projects/#{project.id}"
      end

      it "returns http success" do
        expect(response).to have_http_status(:success)
      end
    end

  end

  describe "Get project/my_projects" do
    
    context "unauthorized user" do
      before do
        get "/api/v1/projects/my_projects"
      end
     
      it 'return response status  401' do
        expect(response).to have_http_status(:unauthorized)
      end

      it 'return error message please login' do
        expect(json['message']).to  eq("Please log in")
      end

    end

    context "authorized user" do
      before do
        get "/api/v1/projects/my_projects", headers:{Authorization: token}
      end

      it 'return response status 201' do
        expect(response).to have_http_status(:success)
      end
    end

  end

  
  describe "PUT project/:id" do
    
    context "unauthorized user" do

      before do
        put "/api/v1/projects/#{project.id}", params: {
          project: {
            title: "updated title",
            description: "new desc",
            location: "ktm",
          }
        }
      end

      it 'return response status  401' do
        expect(response).to have_http_status(:unauthorized)
      end

      it 'return error message please login' do
        expect(json['message']).to eq("Please log in")
      end
    end

    
    context "authorized user" do
      before do 
        put "/api/v1/projects/#{project.id}", params: {
          project: {
            title: "update title",
            description: "new desc",
            location: "ktm",
          }
        }, headers:{Authorization: token}
      end

      it "return successfull status" do
        expect(response).to  have_http_status(:success)
      end
    end
    
  end
end
