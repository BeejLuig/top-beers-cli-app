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

  def style=(style)
    @style = TopBeers::Style.find_or_create_by_name(style)
    @style.beers << self
  end

  def brewery=(brewery)
    @brewery = TopBeers::Brewery.find_or_create_by_name(brewery)
    @brewery.beers << self
  end
end
