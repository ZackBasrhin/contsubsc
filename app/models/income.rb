class Income < ApplicationRecord

  has_many :income_fixed_costs
  has_many :fixed_costs, through: :income_fixed_costs
  belongs_to :user
  
  validates :amount, presence: true

end
