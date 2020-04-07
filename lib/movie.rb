class Movie < Product
  attr_accessor :title, :director, :year

  def initialize(params)
    super

    @title = params[:title]
    @director = params[:director]
    @year = params[:year]
  end

  def to_s
    "Фильм '#{@title}', #{@year}, режиссер - #{@director}, #{super}"
  end

  def update(params)
    super

    @title = params[:title] if params[:title]
    @director = params[:director] if params[:director]
    @year = params[:year] if params[:year]
  end

  def self.from_file(path)
    lines = File.readlines(path, encoding: "UTF-8").map do |line|
      line.chomp
    end

    self.new(
      title: lines[0],
      director: lines[1],
      year: lines[2].to_i,
      price: lines[3].to_i,
      amount: lines[4].to_i
    )
  end

end
