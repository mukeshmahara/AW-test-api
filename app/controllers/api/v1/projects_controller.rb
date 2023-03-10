class Api::V1::ProjectsController < ApplicationController
  before_action :authenticate, except: %i[index show]
  before_action :set_project, only: %i[show update destroy]

  def index
    @project = Project.order("created_at desc").all
    render json: ProjectsSerializer.new(@project), status: 200
  end

  def my_projects
    @my_projects = Project.where(user_id: logged_in_user.id).order('created_at desc')
    render json: ProjectsSerializer.new(@my_projects), status: 200
  end

  def create
    @project = Project.new(project_params.merge({user_id: logged_in_user.id}))

    if @project.save
      render json: ProjectsSerializer.new(@project), status: 201
    else
      render json: @project.errors, status: :unprocessable_entity
    end
  end

  def update
    if @project.user.id.eql? logged_in_user.id
      if @project.update(project_params)
        render json: ProjectsSerializer.new(@project).serialized_json, status: 200
      else
        render json: @project.errors, status: :unprocessable_entity
      end
    else
      render json: {error: "permission denied."}, status: :unauthorized
    end
  end

  def show
    render json: ProjectsSerializer.new(@project), status: 200
  end

  def destroy
    if @project.user.id.eql? logged_in_user.id
      @project.destroy
      render json: {message: "Deleted"}, status: 200
    else
      render json: {message: "permission denied."}, status: :unauthorized
    end
  end

  private
  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:title, :description, :location, :project_type, :thumbnail, :user_id)
  end

end
