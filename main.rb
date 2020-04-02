require_relative 'lib/product'
require_relative 'lib/book'
require_relative 'lib/movie'

grant = Book.new(price: 150, amount: 2)

puts "Книга 'В поисках капитана Гранта' стоит #{grant.price} руб. " \
"Осталось всего #{grant.amount} штуки."
