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

test "product price must be positive" do
product = Product.new(name: 'Lorem Ipsum',
sku: 'SAMS3RED',
supplier_id: 2,
unitinstock: '100',
category_id: 4,
description: 'Wibbles are fun!',
image_url: 'lorem.jpg')
product.price = -1
assert product.invalid?
assert_equal "must be greater than or equal to 0.01",
product.errors[:price].join(';')
product.price = 0
assert product.invalid?
assert_equal "must be greater than or equal to 0.01", 
product.errors[:price].join(';')
product.price = 1
assert product.valid?
end

def new_product(image_url)
Product.new( name: "My Book Title",
sku: 'SAMS3RED',
supplier_id: 2,
unitinstock: '100',
category_id: 4,
description: 'Wibbles are fun!',
price: 1,
image_url: 'image_url'
)
end
test "image url" do
ok = %w{ fred.gif fred.jpg fred.png FRED.JPG FRED.Jpg
http://a.b.c/x/y/z/fred.gif }
bad = %w{ fred.doc fred.gif/more fred.gif.more }
ok.each do |name|
assert new_product(name).valid?, "#{name} shouldn't be invalid"
end
bad.each do |name|
assert new_product(name).invalid?, "#{name} shouldn't be valid"
end
end
end
