class Product < ActiveRecord::Base
  attr_accessible :category_id, :description, :image_url, :name, :price, :sku, :supplier_id, :unitinstock

validates :name, :description, :image_url, :price, :sku, :category_id, :supplier_id, :unitinstock, presence: true

validates :price, numericality: {greater_than_or_equal_to: 0.01}

validates :name, uniqueness: true

validates :image_url, allow_blank: true, format: {
with: %r{\.(gif|jpg|png)$}i,
message: 'must be a URL for GIF, JPG or PNG image.'
}
end


