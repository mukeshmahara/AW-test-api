class Api::V1::ContentsController < ApplicationController
  before_action :authenticate, only: %i[create destroy update]
  before_action :set_content, only: %i[show update destroy]

  def index
    @project = Project.find(params[:project_id])
    @content = @project.contents.order("created_at desc")
    render json: ContentSerializer.new(@content), status: 200
  end

  def create
    @project = Project.find(params[:project_id]) if params[:project_id]
    if @project.user.id.eql? logged_in_user.id
      @content = Content.new(content_params.merge({project_id: @project.id, user_id: logged_in_user.id}))
      if @content.save!
        render json: ContentSerializer.new(@content), status: 201
      else
        render json: @content.errors, status: :unprocessable_entity
      end
    else
      render json: {error: "permission denied."} , status: :unauthorized
    end
  end

  def update
    if @content.user.id.eql? logged_in_user.id
      if @content.update(content_params)
        render json: ContentSerializer.new(@content), status: 200
      else
        render json: @content.errors, status: :unprocessable_entity
      end
    else
      render json: {error: "permission denied."}, status: :unauthorized
    end
  end

  def show
    @project = Project.find(params[:project_id]) if params[:project_id]

    if(@project.contents.ids.include? params[:id].to_i)
      
      @content = @project.contents.find_by(id: params[:id])
      if  logged_in_user
        render json: ContentSerializer.new(@content), status: 200
      else
        render json: {error:"permission denied."}, status: :unauthorized
      end
    else
      render json: {error:"reqeuest content not found."}, status: 200

    end
  end

  def destroy
    if @content.user.id.eql? logged_in_user.id
      @content.destroy
      render json: {message: "Deleted"}, status: 200
    else
      render json: {message: "permission denied."}, status: :unauthorized
    end
  end

  private
  def content_params
    params.require(:content).permit(:title, :body, :project_id)
  end

  def set_content
    @content = Content.find(params[:id])
  end
end
