class AddUsersToBeers < ActiveRecord::Migration[6.1]
  def change
    add_reference :beers, :user, null: false, foreign_key: true
  end
end
