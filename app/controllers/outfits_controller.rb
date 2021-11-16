class OutfitsController < ApplicationController

  def new
    @outfit = Outfit.new
  end

end
