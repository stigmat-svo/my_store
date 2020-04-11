require_relative 'product_collection'
require_relative 'cart_product'

class Cart < ProductCollection
  def total_price
    @products.map(&:price).sum
  end

  def add_product(product)
    @products << product
  end

  def remove_product(product)
    @products -= product
  end

  def empty?
    @products.empty?
  end

  def to_s
    @products.uniq.map do |product|
      "#{CartProduct.new(product, @products.count(product))}"
    end.join("\n")
  end
end
