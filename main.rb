require_relative "lib/product"
require_relative "lib/movie"
require_relative "lib/book"

stuff = []

stuff << Movie.new(
  title: "От заката до рассвета",
  genre: "1996",
  author: "Роберт Родригес",
  price: 850,
  amount: 3
)

stuff << Movie.new(
  title: "Козырные тузы",
  genre: "2006",
  author: "Джо Карнахан",
  price: 699,
  amount: 2
)

stuff << Book.new(
  title: "Айвенго",
  genre: "роман",
  author: "Вальтер Скотт",
  price: 1250,
  amount: 15
)

stuff << Book.new(
  title: "Ловец орлов",
  genre: "повесть",
  author: "Джеймс Уиллард Шульц",
  price: 1050,
  amount: 20
)

puts "Список товаров нашего магазина:"
puts

stuff.each do |item|
  puts item
end


