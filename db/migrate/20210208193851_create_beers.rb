class CreateBeers < ActiveRecord::Migration[6.1]
  def change
    create_table :beers do |t|
      t.string :name
      
      t.string :brewery
      t.date :sample_date

      t.timestamps
    end
  end
end
