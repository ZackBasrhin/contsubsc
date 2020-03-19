class Income < ApplicationRecord
  validates :content, presence: true
  has_many :income_fixed_costs
  has_many :fixed_costs, through: :income_fixed_costs
  belongs_to :user
end
