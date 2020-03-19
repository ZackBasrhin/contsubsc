class CreateIncomes < ActiveRecord::Migration[5.2]
  def change
    create_table :incomes do |t|
      t.integer :amount, null: false
      t.timestamps
    end
  end
end
