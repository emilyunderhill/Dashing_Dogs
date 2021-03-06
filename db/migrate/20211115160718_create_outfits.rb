class CreateOutfits < ActiveRecord::Migration[6.0]
  def change
    create_table :outfits do |t|
      t.string :name
      t.string :size
      t.integer :price
      t.integer :max_loan_period
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
