class AddPrecisionToDogsTable < ActiveRecord::Migration[6.0]
  def change
    change_column :dogs, :latitude, :decimal, precision: 7, scale: 4 
    change_column :dogs, :longitude, :decimal, precision: 7, scale: 4 
  end
end
