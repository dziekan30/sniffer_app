class AddPrecisionToDogsTableForPrice < ActiveRecord::Migration[6.0]
  def change
        change_column :dogs, :price, :decimal, precision: 7, scale: 4 
  end
end
