class TopBeers::Beer
  attr_accessor :name, :style, :abv, :brewery, :url, :ba_score, :availability, :description

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

end
