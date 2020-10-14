class Gallery

  attr_reader :name, :city

  @@galleries = []

  def initialize(name, city)
    @name = name
    @city = city
    @@galeries << self
  end

  def paintings 
    Painting.all.select {|painting| painting.gallery == self }
  end

  def artists 
    paintings.map {|painting| painting.artist }
  end

  def artists_names 
    artists.map {|artist| artist.name }
  end

  def most_expensive_painting
    max = 0 
    piece = nil 
    paintings.each do |painting|
      if painting.price > max 
        max = painting.price 
        piece = painting
      end
    end
    piece 
  end

  def self.all 
    @@galeries
  end

end
