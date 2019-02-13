class CreateCars < ActiveRecord::Migration[5.2]
  def change
    create_table :cars do |t|
      t.string :number
      t.string :color
      t.integer :release_year

      t.timestamps null: false
    end
  end
end
