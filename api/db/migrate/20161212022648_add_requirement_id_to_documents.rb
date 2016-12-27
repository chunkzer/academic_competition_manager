class AddRequirementIdToDocuments < ActiveRecord::Migration
  def change
    add_reference :documents, :requirement, index: true, foreign_key: true
  end
end
