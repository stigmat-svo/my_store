require_relative 'product_collection'
require_relative 'cart_product'

class Cart < ProductCollection
  def to_s
    @products.uniq.map do |product|
      "#{CartProduct.new(product, @products.count(product))}"
    end.join("\n")
  end
end
