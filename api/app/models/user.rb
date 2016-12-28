class User < ActiveRecord::Base

  has_many   :event_subscribers
  has_many   :documents


end
