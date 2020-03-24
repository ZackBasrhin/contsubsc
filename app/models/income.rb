class Income < ApplicationRecord

  validates :content, presence: true
  has_many :income_fixed_costs
  has_many :fixed_costs, through: :income_fixed_costs
  belongs_to :user
  # accepts_nested_attributes_for :income_fixed_cost, allow_destroy: true

end
