class EventsController < ApplicationController
  before_action :set_event, only: [:show, :update, :destroy]

  # GET /events
  # GET /events.json
  def index
    if @current_user.super_admin?
      @events = Event.all.order(:registration_deadline)
    else
      @events = Event.upcoming.order(:registration_deadline)
    end

    render json: @events, serializer_params: { current_user: @current_user }
  end

  # GET /events/1
  # GET /events/1.json
  def show
    render json: @event, serializer_params: { current_user: @current_user }
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)
    if @event.save
      requirement_params[:requirements].each do |req|
        req = Requirement.find(req["id"].to_i)
        EventRequirement.create({event_id: @event.id, requirement_id: req.id})
      end
      render json: @event, serializer_params: { current_user: @current_user }, status: :created
    else
      render json: @event.errors, serializer_params: { current_user: @current_user }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      render json: @event, serializer_params: { current_user: @current_user }, status: :updated
    else
      render json: @event.errors, serializer_params: { current_user: @current_user }, status: :unprocessable_entity
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy

    head :no_content
  end

  private

    def set_event
      @event = Event.find(params[:id])
    end

    def event_params
      params.require(:event).permit(:name, :event_date, :registration_deadline, :description)
    end

    def requirement_params
      params.require(:event).permit(requirements: [:id, :description])
    end
end
