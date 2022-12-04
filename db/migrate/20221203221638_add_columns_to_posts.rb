class AddColumnsToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :category, :string
    add_column :posts, :location, :string
  end
end
