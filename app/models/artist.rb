class Artist

  attr_reader :name, :years_experience

  @@artists = []

  def initialize(name, years_experience)
    @name = name
    @years_experience = years_experience
    @@artists << self
  end

  def paintings 
    Painting.all.select {|painting| painting.artist == self}
  end

  def galleries 
    paintings.map {|painting| painting.gallery }
  end

  def cities 
    galleries.map {|gallery| gallery.city }
  end

  def create_painting(title, price, gallery)
    Painting.new(title, price, self, gallery)
  end

  def self.all
    @@artists 
  end

  def self.total_experience
    self.all.sum {|artist| artist.years_experience }
  end

  def self.most_prolific 
    max = 0
    creator = nil 
    self.all.each do |artist|
      ppy = artist.paintings.count / artist.years_experience
      if ppy > max
        max = ppy 
        creator = artist
      end
    end
    creator 
  end
  
end
