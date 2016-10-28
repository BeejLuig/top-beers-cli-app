class TopBeers::Beer
  attr_reader :name, :style, :abv, :brewery, :url, :ba_score, :availability, :description

  @@all = []

  def initialize(attributes = {})
    @name = attributes[:name]
    @url = attributes[:url]
    @abv = attributes[:abv]
    @style = TopBeers::Style.find_or_create_by_name(attributes[:style])
    @brewery = TopBeers::Brewery.find_or_create_by_name(attributes[:brewery])
    @style.beers << self
    @brewery.beers << self
    @@all << self
  end

  def self.all
    @@all
  end

  def update_beer_info(attributes = {})
    @ba_score = attributes[:ba_score]
    @availability = attributes[:availability]
    @description = attributes[:description]
    @brewery.location_1 = attributes[:location_1]
    @brewery.location_2 = attributes[:location_2]
    @brewery.website = attributes[:website]
  end

end
