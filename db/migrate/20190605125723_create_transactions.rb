class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.boolean :status
      t.integer :service_id
      t.integer :ai_id

      t.timestamps
    end
  end
end
