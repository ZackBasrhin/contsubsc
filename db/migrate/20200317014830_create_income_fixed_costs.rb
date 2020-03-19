class CreateIncomeFixedCosts < ActiveRecord::Migration[5.2]
  def change
    create_table :income_fixed_costs do |t|
      t.references :income, foreign_key: true
      t.references :fixed_cost, foreign_key: true
      t.timestamps
    end
  end
end
