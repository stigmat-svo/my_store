class CartProduct
  def initialize(product, amount = 1)
    @product = product
    @amount = amount
  end

  def to_s
    "#{@product.full_name}, количество: #{@amount} — #{price} руб."
  end

  def price
    @product.price * @amount
  end

end
