class Product < ActiveRecord::Base
 has_many :line_items
 before_destroy :ensure_not_referenced_by_any_line_item

private



# ensure that there are no line items referencing this product
def ensure_not_referenced_by_any_line_item
if line_items.empty?
return true
else
errors.add(:base, 'Line Items present')
return false
end
end

 attr_accessible :category_id, :description, :image_url, :name, :price, :sku, :supplier_id, :unitinstock

validates :name, :description, :image_url, :price, :sku, :category_id, :supplier_id, :unitinstock, presence: true

validates :price, numericality: {greater_than_or_equal_to: 0.01}

validates :name, uniqueness: true

validates :image_url, allow_blank: true, format: {
with: %r{\.(gif|jpg|png)$}i,
message: 'must be a URL for GIF, JPG or PNG image.'
}
end


