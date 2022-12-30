class CreateAbouts < ActiveRecord::Migration[7.0]
  def change
    create_table :abouts do |t|
      t.text :profile
      t.integer :number_of_countries
      t.integer :number_of_met_people
      t.integer :number_of_friends
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
