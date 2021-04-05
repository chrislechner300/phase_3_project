class AddRatingToBeers < ActiveRecord::Migration[6.1]
  def change
    add_column :beers, :rating, :integer
  end
end
