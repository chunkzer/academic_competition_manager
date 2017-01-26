class EventSubscriptionsController < ApplicationController
  before_action :set_event_subscription, only: [:show, :update, :destroy]

  # GET /event_subscriptions
  # GET /event_subscriptions.json
  def index
    if @current_user.super_admin?
      @event_subscriptions = EventSubscription.all
    elsif @current_user.admin?
      @event_subscriptions = EventSubscription.where(approved: false).event_is_upcoming
    else
      @event_subscriptions = @current_user.event_subscriptions("approved DESC").event_is_upcoming
    end
    render json: @event_subscriptions
  end

  # GET /event_subscriptions/1
  # GET /event_subscriptions/1.json
  def show
    render json: @event_subscription
  end

  # POST /event_subscriptions
  # POST /event_subscriptions.json
  def create
    @event_subscription = EventSubscription.new(event_subscription_params)

    if @event_subscription.save
      file_params.each do |requirement|
        if(requirement["doc"])
          requirement.symbolize_keys
          requirement[:doc].symbolize_keys
          path = "data:#{requirement[:doc][:filetype]};base64, #{requirement[:doc][:base64]}"
          Document.create(user_id: @event_subscription.user_id,
                         event_id: @event_subscription.event_id,
                         requirement_id: requirement[:id],
                         path: path
                         )
        end
      end
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

    def file_params
      params.require(:event_subscription).fetch(:requirements)
    end
end
