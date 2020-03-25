class FixedCostsController < ApplicationController
  before_action :set_income, except: [:edit, :new, :create]

  def index
  end

  def edit
    @fixed_costs = FixedCost.all
  end

end
