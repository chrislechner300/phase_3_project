class AddCommentsToBeers < ActiveRecord::Migration[6.1]
  def change
    add_column :beers, :comments, :string
  end
end
