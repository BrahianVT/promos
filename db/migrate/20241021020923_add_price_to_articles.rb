class AddPriceToArticles < ActiveRecord::Migration[7.0]
  def change
    add_column :articles, :price, :float
  end
end
