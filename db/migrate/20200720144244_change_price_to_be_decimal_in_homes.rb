class ChangePriceToBeDecimalInHomes < ActiveRecord::Migration[6.0]
  def change
    change_column :homes, :price, 'integer USING CAST(price AS integer)'
  end
end
