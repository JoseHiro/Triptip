class RenameLocationColumnToPosts < ActiveRecord::Migration[7.0]
  def change
    rename_column :posts, :location, :address
  end
end
