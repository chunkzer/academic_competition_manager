class RequirementsController < ApplicationController
  before_action :set_requirement, only: [:show, :update, :destroy]

  # GET /requirements
  # GET /requirements.json
  def index
    @requirements = Requirement.all

    render json: @requirements
  end

  # GET /requirements/1
  # GET /requirements/1.json
  def show
    render json: @requirement
  end

  # POST /requirements
  # POST /requirements.json
  def create
    @requirement = Requirement.new(requirement_params)

    if @requirement.save
      render json: @requirement, status: :created, location: @requirement
    else
      render json: @requirement.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /requirements/1
  # PATCH/PUT /requirements/1.json
  def update
    @requirement = Requirement.find(params[:id])

    if @requirement.update(requirement_params)
      head :no_content
    else
      render json: @requirement.errors, status: :unprocessable_entity
    end
  end

  # DELETE /requirements/1
  # DELETE /requirements/1.json
  def destroy
    @requirement.destroy

    head :no_content
  end

  private

    def set_requirement
      @requirement = Requirement.find(params[:id])
    end

    def requirement_params
      params.require(:requirement).permit(:description)
    end
end
