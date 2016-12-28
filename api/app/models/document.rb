class Document < ActiveRecord::Base

  belongs_to :user
  belongs_to :event
  has_one    :requirement

end
