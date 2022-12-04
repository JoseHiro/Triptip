class AddColumnToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :title, :string, null: false
  end
end
