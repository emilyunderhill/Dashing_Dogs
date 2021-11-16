class OutfitsController < ApplicationController
  def show
    @outfit = Outfit.find(params[:id])
  end

  def index
    @outfits = Outfit.all
  end

  def destroy
    @outfit = Outfit.find(params[:id])
    @outfit.destroy!
    redirect_to '/outfits', :notice => "The outfit: #{@outfit.name} has been deleted"
  end
end
