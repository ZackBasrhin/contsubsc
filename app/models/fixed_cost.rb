class FixedCost < ApplicationRecord
  validates :integer, presence: true

  has_many :income_fixed_costs
  has_many :incomes, through: :income_fixed_costs
end
