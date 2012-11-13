require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  test "product attributes must not be empty" do
product = Product.new
assert product.invalid?
assert product.errors[:name].any?
assert product.errors[:sku].any?
assert product.errors[:supplier_id].any?
assert product.errors[:unitinstock].any?
assert product.errors[:price].any?
assert product.errors[:category_id].any?
assert product.errors[:description].any?
assert product.errors[:image_url].any?
end
end
