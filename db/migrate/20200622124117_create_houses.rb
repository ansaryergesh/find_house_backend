class CreateHouses < ActiveRecord::Migration[6.0]
  def change
    create_table :houses do |t|
      t.string :name
      t.text :description
      t.string :price
      t.string :created_by

      t.timestamps
    end
  end
end
