require_relative 'lib/cart'

collection = ProductCollection.from_dir(__dir__)
collection.sort!(by: :title)

cart = Cart.new

choice = nil

puts "Здравствуйте! Вот выбор товаров нашего магазина:\n\n"

until choice == 0

  puts collection

  puts "\nЧтобы закончить покупки, введите 0."

  puts "\nВведите номер товара, который хотите приобрести:"
  print ">> "

  choice = STDIN.gets.to_i

  if choice.zero?
    break
  end

  purchase_product = collection.to_a[choice - 1]

  cart.add_product(purchase_product)

  puts "\nВы выбрали: #{purchase_product} \n\n"

  purchase_product.amount -= 1

  if purchase_product.amount.zero?
    collection.to_a.delete(purchase_product)
  end
end

if cart.empty?
  puts "\nВы ничего не купили. До свидания!"
  exit
end


puts "\nВы купили:\n\n"
puts cart
puts "\nС Вас — #{cart.total_price} руб. Спасибо за покупки!"
