class CreateShopLists < ActiveRecord::Migration[6.0]
  def change
    create_table :shop_lists do |t|
      t.text :to_buy, null: false

      t.timestamps
    end
  end
end
