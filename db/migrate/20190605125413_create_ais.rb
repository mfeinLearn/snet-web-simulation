class CreateAis < ActiveRecord::Migration[5.2]
  def change
    create_table :ais do |t|
      t.string :name
      t.integer :user_id
      t.string :description
      t.integer :balance
      t.timestamps
    end
  end
end
