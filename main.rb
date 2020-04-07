require_relative "lib/product"
require_relative "lib/movie"
require_relative "lib/book"

puts "Список товаров нашего магазина:"
puts

movie = Movie.from_file(File.dirname(__FILE__) + "/data/movies/03.txt")
book = Book.from_file(File.dirname(__FILE__) + "/data/books/05.txt")

puts movie
puts book

begin
  Product.from_file(File.dirname(__FILE__) + "/data/movies/*.txt")
rescue NotImplementedError
  puts "\n! ! ! Ошибка ! ! !"
  puts "Дочерний класс пытается создать себя, используя статический метод родителя."
end
