class User < ActiveRecord::Base

  has_many   :event_subscriptions
  has_many   :documents


end
