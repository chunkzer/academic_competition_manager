class Document < ActiveRecord::Base

  belongs_to :user
  belongs_to :event
  belongs_to :requirement, foreign_key: "requirement_id"

  mount_base64_uploader :path, PathUploader

end
