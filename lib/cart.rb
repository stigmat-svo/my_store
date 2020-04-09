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

  def prod_in_cart
    @products.uniq.map do |product|
      CartProduct.new(product, @products.count(product))
    end
  end
end