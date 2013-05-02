class CreateDebts < ActiveRecord::Migration
  def change
    create_table :debts do |t|
      t.decimal :amount
      t.integer :victim_id
      t.string :status

      t.timestamps
    end
  end
end
