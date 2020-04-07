class Movie < Product
  attr_reader :title, :author, :genre

  def initialize(params)
    super

    @title = params[:title]
    @director = params[:author]
    @year = params[:genre]
  end

  def to_s
    "Фильм '#{@title}', #{@year}, режиссер #{@director}, #{super}"
  end

end
