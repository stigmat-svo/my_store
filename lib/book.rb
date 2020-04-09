class Book < Product
  attr_accessor :title, :genre, :author

  def initialize(params)
    super
    @title = params[:title]
    @genre = params[:genre]
    @author = params[:author]
  end

  def to_s
    "#{full_name}, #{super}"
  end

  def full_name
    "Книга '#{@title}', #{@genre}. Автор — #{@author}"
  end

  def self.from_file(path)
    lines = File.readlines(path, encoding: "UTF-8").map do |line|
      line.chomp
    end

    self.new(
      title: lines[0],
      genre: lines[1],
      author: lines[2],
      price: lines[3].to_i,
      amount: lines[4].to_i
    )
    end
end
