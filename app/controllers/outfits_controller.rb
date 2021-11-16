class OutfitsController < ApplicationController
  before_action :set_outfit, only: %i[show edit]

  def new
    @outfit = Outfit.new
  end

  def create
    @outfit = Outfit.new(outfit_params)
    @outfit.save

    redirect_to outfit_path(@outfit)
  end

  def show; end

  def index
    @outfits = Outfit.all
  end

  def edit; end

  def update
    @oufit.update(outfit_params)

    redirect_to outfit_path(@outfit)
  end

  private

  def outfit_params
    params.require(:outfit).permit(:name, :size, :price, :max_loan_period)
  end

  def set_outfit
    @outfit = Outfit.find(params[:id])
  end

end
