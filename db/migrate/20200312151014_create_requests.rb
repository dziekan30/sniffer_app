class CreateRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :requests do |t|
      t.integer :dog_id
      t.integer :user_id
      t.boolean :approved

      t.timestamps
    end
  end
end
