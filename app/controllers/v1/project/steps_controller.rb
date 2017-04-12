class V1::Project::StepsController < ApplicationController
  before_action :set_project_step, only: [:show, :update, :destroy]

  # GET /project/steps
  def index
    @project_steps = ::Project::Step.where(project_id: params[:project_id])

    render json: @project_steps
  end

  # GET /project/steps/1
  def show
    render json: @project_step
  end

  # POST /project/steps
  def create
    @project_step = ::Project::Step.new(project_step_params)
    @project_step.project_id = params[:project_id]

    if @project_step.save
      render json: @project_step, status: :created, location: v1_project_step_url(@project_step.project_id, @project_step.id)
    else
      render json: @project_step.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /project/steps/1
  def update
    if @project_step.update(project_step_params)
      render json: @project_step
    else
      render json: @project_step.errors, status: :unprocessable_entity
    end
  end

  # DELETE /project/steps/1
  def destroy
    @project_step.destroy
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_project_step
    @project_step = ::Project::Step.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def project_step_params
    params.require(:project_step).permit(:content, :done)
  end
end