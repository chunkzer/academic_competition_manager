class EventRequirementsController < ApplicationController
  before_action :set_event_requirement, only: [:show, :update, :destroy]

  # GET /event_requirements
  # GET /event_requirements.json
  def index
    @event_requirements = EventRequirement.all

    render json: @event_requirements
  end

  # GET /event_requirements/1
  # GET /event_requirements/1.json
  def show
    render json: @event_requirement
  end

  # POST /event_requirements
  # POST /event_requirements.json
  def create
    @event_requirement = EventRequirement.new(event_requirement_params)

    if @event_requirement.save
      render json: @event_requirement, status: :created, location: @event_requirement
    else
      render json: @event_requirement.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /event_requirements/1
  # PATCH/PUT /event_requirements/1.json
  def update
    @event_requirement = EventRequirement.find(params[:id])

    if @event_requirement.update(event_requirement_params)
      head :no_content
    else
      render json: @event_requirement.errors, status: :unprocessable_entity
    end
  end

  # DELETE /event_requirements/1
  # DELETE /event_requirements/1.json
  def destroy
    @event_requirement.destroy

    head :no_content
  end

  private

    def set_event_requirement
      @event_requirement = EventRequirement.find(params[:id])
    end

    def event_requirement_params
      params.require(:event_requirement).permit(:event_id, :requirement_id)
    end
end
