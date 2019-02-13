class CreateTrucks < ActiveRecord::Migration[5.2]
  def change
    create_table :trucks do |t|
      t.string :number
      t.string :color
      t.decimal :trailer_volume

      t.timestamps null: false
    end
  end
end
