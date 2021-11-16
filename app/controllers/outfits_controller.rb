class OutfitsController < ApplicationController

  def show
    @outfit = Outfit.find(params[:id])

  def index
    @outfits = Outfit.all

  end
end
