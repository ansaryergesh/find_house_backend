class DropTablehouses < ActiveRecord::Migration[6.0]
  def change
    drop_table :houses
  end
end
