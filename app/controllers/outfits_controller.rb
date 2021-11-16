class OutfitsController < ApplicationController
  def show
    @outfit = Outfit.find(params[:id])
  end

  def index
    @outfits = Outfit.all
  end

  def new
    @outfit = Outfit.new
  end

end
