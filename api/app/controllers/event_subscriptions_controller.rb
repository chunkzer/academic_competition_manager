class EventSubscriptionsController < ApplicationController
  before_action :set_event_subscription, only: [:show, :update, :destroy]

  # GET /event_subscriptions
  # GET /event_subscriptions.json
  def index
    @event_subscriptions = EventSubscription.all

    render json: @event_subscriptions
  end

  # GET /event_subscriptions/1
  # GET /event_subscriptions/1.json
  def show
    render json: @event_subscription
  end

  # GET /pending_subscribers
  # GET /pending_subscribers.json
  def pending_subscriptions
    @event_subscriptions = EventSubscription.where(approved: false).paginate(page: params[:page], per_page: 25)
    render json: @event_subscriptions
  end
  # POST /event_subscriptions
  # POST /event_subscriptions.json
  def create
    @event_subscription = EventSubscription.new(event_subscription_params)

    if @event_subscription.save
      render json: @event_subscription, status: :created, location: @event_subscription
    else
      render json: @event_subscription.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /event_subscriptions/1
  # PATCH/PUT /event_subscriptions/1.json
  def update
    @event_subscription = EventSubscription.find(params[:id])

    if @event_subscription.update(event_subscription_params)
      head :no_content
    else
      render json: @event_subscription.errors, status: :unprocessable_entity
    end
  end

  # DELETE /event_subscriptions/1
  # DELETE /event_subscriptions/1.json
  def destroy
    @event_subscription.destroy

    head :no_content
  end

  private

    def set_event_subscription
      @event_subscription = EventSubscription.find(params[:id])
    end

    def event_subscription_params
      params.require(:event_subscription).permit(:user_id, :event_id)
    end
end
