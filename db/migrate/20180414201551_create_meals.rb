class CreateMeals < ActiveRecord::Migration[5.1]
  def change
    create_table :meals do |t|
      t.string :name
      t.datetime :start_time
      t.text :meal_items
      t.integer :calories
      t.text :mood

      t.timestamps
    end
  end
end
