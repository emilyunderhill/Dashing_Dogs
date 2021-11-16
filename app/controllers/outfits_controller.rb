class OutfitsController < ApplicationController
  before_action :set_outfit, only: %i[show edit update]
  before_action :authenticate_user!

  def new
    @outfit = Outfit.new
  end

  def create
    @outfit = Outfit.new(outfit_params)
    if @outfit.save
      redirect_to outfit_path(@outfit)
    else
      render :new
    end
  end

  def show; end

  def index
    @outfits = Outfit.all
  end

  def edit; end

  def update
    if @outfit.update(outfit_params)
      redirect_to outfit_path(@outfit)
    else
      render :edit
    end
  end

  def destroy
    @outfit = Outfit.find(params[:id])
    @outfit.destroy!
    redirect_to '/outfits', :notice => "The outfit: #{@outfit.name} has been deleted"
  end

  private

  def outfit_params
    params.require(:outfit).permit(:name, :size, :price, :max_loan_period, :photo)
  end

  def set_outfit
    @outfit = Outfit.find(params[:id])
  end

end
