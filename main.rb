require_relative 'lib/cart'

collection = ProductCollection.from_dir(__dir__)

showcase = collection.to_a.select do |product|
  product.amount.positive?
end
  .sample(15)

cart = Cart.new

until showcase.empty?
  showcase.each_with_index do |product, index|
    puts "#{index + 1}. #{product}"
  end

  puts "0. Выход"

  choice = STDIN.gets.to_i

  if choice.zero?
    break
  end

  purchase_product = showcase[choice - 1]

  cart.add_product(purchase_product)

  puts "\nВы выбрали: #{purchase_product} \n\n"

  purchase_product.amount -= 1

  if purchase_product.amount.zero?
    showcase.delete(purchase_product)
  end
end

if cart.empty?
  exit
end
puts

puts "Вы купили:"
puts cart.prod_in_cart
puts "\nС Вас — #{cart.total_price} руб. Спасибо за покупки!"
