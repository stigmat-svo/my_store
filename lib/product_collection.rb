require_relative 'product'
require_relative 'movie'
require_relative 'book'
require_relative 'disk'

class ProductCollection
  def initialize(products = [])
    @products = products
  end

  def self.from_dir(dir_path)
    paths = Dir[File.join(dir_path, 'data', '*', '*.txt')]

    products = paths.map do |path|
      type = File.basename(File.dirname(path)).chop.capitalize
      Object.const_get(type).from_file(path)
    end

    new(products)
  end

  def to_a
    @products
  end

  def show_product
    to_a.select do |product|
      product.amount > 0
    end
  end

end