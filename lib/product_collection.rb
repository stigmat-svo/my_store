require_relative 'product'
require_relative 'movie'
require_relative 'book'
require_relative 'disk'

class ProductCollection

  def initialize(products = [])
    @products = products
    @sort_result = []
  end

  def self.from_dir(dir_path)
    paths = Dir[File.join(dir_path, 'data', '*', '*.txt')]

    products = paths.map do |path|
      type = File.basename(File.dirname(path)).chop.capitalize
      Object.const_get(type).from_file(path)
    end

    self.new(products)
  end

  def to_a
    @products
  end

  def product_types
    @products.map(&:type).uniq
  end

  def products_by_type(type)
    @products.select do |product|
      product.type == type
    end
  end

  def product_by_index
    product_types.map do |type|
      products_by_type(type)
    end
      .flatten
      .map.with_index(1) do |product, index|
      "#{index}. #{product}"
    end.join("\n")
  end

  def to_s
    "#{product_by_index}"
  end

  def sort!(by:, order: :asc)
    case :by
    when :title
      @products.sort_by!(&:title)
    when :price
      @products.sort_by!(&:price)
    when :amount
      @products.sort_by!(&:price)
    end

    @products.reverse! if order == :desc

    self
  end
end
