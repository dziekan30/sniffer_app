class CreateMakeups < ActiveRecord::Migration[6.0]
  def change
    create_table :makeups do |t|
      t.integer :dog_id
      t.integer :breed_id

      t.timestamps
    end
  end
end
