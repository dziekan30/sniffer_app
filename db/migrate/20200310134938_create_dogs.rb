class CreateDogs < ActiveRecord::Migration[6.0]
  def change
    create_table :dogs do |t|
      t.string :name
      t.string :breed_description
      t.text :bio
      t.boolean :active_status
      t.integer :size
      t.decimal :latitude
      t.decimal :longitude
      t.integer :user_id
      t.decimal :price
      t.string :address
      t.string :city
      t.string :zipcode

      t.timestamps
    end
  end
end
