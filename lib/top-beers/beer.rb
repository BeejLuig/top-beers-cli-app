class TopBeers::Beer
  attr_accessor :name, :style, :abv, :brewery, :url, :ba_score

  @@all = []

  def initialize
    @@all << self
  end

  def self.all
    @@all
  end

end
