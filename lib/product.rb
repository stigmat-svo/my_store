class Product
  attr_accessor :price, :amount

  def initialize(params)
    @price = params[:price]
    @amount = params[:amount]
  end

  def type
    self.class.name.downcase
  end

  def buy
    if amount > 0
      self.amount -= 1
      return price
    else
      nil
    end
  end

  def to_s
    "#{@price} руб. Осталось #{@amount}."
  end
end