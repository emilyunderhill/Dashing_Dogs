class OutfitsController < ApplicationController
  def show
    @outfit = Outfit.find(params[:id])
  end
end
