class AddDescriptionToOutifts < ActiveRecord::Migration[6.0]
  def change
    add_column :outfits, :description, :string
  end
end
