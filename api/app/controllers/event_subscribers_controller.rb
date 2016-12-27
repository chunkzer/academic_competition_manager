class EventSubscribersController < ApplicationController
  before_action :set_event_subscriber, only: [:show, :update, :destroy]

  # GET /event_subscribers
  # GET /event_subscribers.json
  def index
    @event_subscribers = EventSubscriber.all

    render json: @event_subscribers
  end

  # GET /event_subscribers/1
  # GET /event_subscribers/1.json
  def show
    render json: @event_subscriber
  end

  # POST /event_subscribers
  # POST /event_subscribers.json
  def create
    @event_subscriber = EventSubscriber.new(event_subscriber_params)

    if @event_subscriber.save
      render json: @event_subscriber, status: :created, location: @event_subscriber
    else
      render json: @event_subscriber.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /event_subscribers/1
  # PATCH/PUT /event_subscribers/1.json
  def update
    @event_subscriber = EventSubscriber.find(params[:id])

    if @event_subscriber.update(event_subscriber_params)
      head :no_content
    else
      render json: @event_subscriber.errors, status: :unprocessable_entity
    end
  end

  # DELETE /event_subscribers/1
  # DELETE /event_subscribers/1.json
  def destroy
    @event_subscriber.destroy

    head :no_content
  end

  private

    def set_event_subscriber
      @event_subscriber = EventSubscriber.find(params[:id])
    end

    def event_subscriber_params
      params.require(:event_subscriber).permit(:user_id, :event_id)
    end
end
