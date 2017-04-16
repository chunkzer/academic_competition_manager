class AddIssueAttr < ActiveRecord::Migration
  def change
    add_column :documents, :issue, :text
  end
end
