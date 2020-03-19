class CreateFixedCosts < ActiveRecord::Migration[5.2]
  def change
    create_table :fixed_costs do |t|
      t.integer :amount, null: false
      t.text :name, null: false
      t.timestamps
    end
  end
end
