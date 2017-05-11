class TutorUser < ActiveRecord::Base

  has_one :user, foreign_key: :tutor_id
  has_one :user
  
end
