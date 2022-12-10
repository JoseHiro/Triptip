class AddColumnToLocation < ActiveRecord::Migration[7.0]
  def change
    add_reference :locations, :user, null: false, foreign_key: true
  end
end
