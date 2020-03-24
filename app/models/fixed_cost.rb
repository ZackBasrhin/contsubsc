class FixedCost < ApplicationRecord
  validates :integer, presence: true

  has_many :income_fixed_costs
  has_many :incomes, through: :income_fixed_costs
  
  def view_name_and_amount
    "#{name} (#{amount}円)"
  end

end
