require_relative "lib/product"
require_relative "lib/movie"
require_relative "lib/book"
require_relative "lib/product_collection"

puts "Список товаров нашего магазина:"
puts

=begin
movie = Movie.from_file(File.dirname(__FILE__) + "/data/movies/03.txt")
book = Book.from_file(File.dirname(__FILE__) + "/data/books/05.txt")

puts movie
puts book
=end

collection = ProductCollection.from_dir(File.dirname(__FILE__) + '/data')

collection.sort!(by: :price, order: :asc)

collection.to_a.each do |product|
  puts product
end

begin
  Product.from_file(File.dirname(__FILE__) + "/data/movies/*.txt")
rescue NotImplementedError
  puts "\n! ! ! Ошибка ! ! !"
  puts "Дочерний класс пытается создать себя, используя статический метод родителя."
end
