class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :sku
      t.string :supplier_id
      t.string :unitinstock
      t.string :price
      t.string :category_id
      t.text :description
      t.string :image_url

      t.timestamps
    end
  end
end
