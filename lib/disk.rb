class Disk < Product
  attr_accessor :album, :genre, :artist

  def initialize(params)
    super
    @album = params[:album]
    @genre = params[:genre]
    @artist = params[:artist]
  end

  def to_s
    "#{full_name}, #{super}"
  end

  def full_name
    "Альбом #{@artist} — #{@album}, #{@genre}"
  end

  def self.from_file(path)
    lines = File.readlines(path, encoding: "UTF-8").map do |line|
      line.chomp
    end

    self.new(
      album: lines[0],
      artist: lines[1],
      genre: lines[2],
      year: lines[3].to_i,
      price: lines[4].to_i,
      amount: lines[5].to_i
    )
  end
end