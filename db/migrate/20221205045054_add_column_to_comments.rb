class AddColumnToComments < ActiveRecord::Migration[7.0]
  def change
    add_column :comments, :suggestion, :boolean
    add_column :comments, :outcome, :boolean
  end
end
