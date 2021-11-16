class OutfitsController < ApplicationController

  def new
    @outfit = Outfit.new
  end

  def create
    @outfit = Outfit.new(outfit_params)
    @outfit.save

    redirect_to outfit_path(@outfit)
  end

  private

  def outfit_params
    params.require(:outfit).permit(:name, :size, :price, :max_loan_period)
  end

end
