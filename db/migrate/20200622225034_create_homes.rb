class CreateHomes < ActiveRecord::Migration[6.0]
  def change
    create_table :homes do |t|
      t.string :name
      t.string :descripton
      t.string :price
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
