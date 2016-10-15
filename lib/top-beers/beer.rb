class TopBeers::Beer
  attr_accessor :name, :style, :abv, :brewery, :url, :ba_score

  def self.beerlist

    beer_1 = self.new
    beer_1.name = "Good Morning"
    beer_1.style = "American Double / Imperial Stout"
    beer_1.abv = "8.40%"
    beer_1.brewery = "Tree House Brewing Company"
    beer_1.url = "https://www.beeradvocate.com/beer/profile/28743/136936/"
    beer_1.ba_score = "100"

    beer_2 = self.new
    beer_2.name = "Kentucky Brunch Brand Stout"
    beer_2.style = "American Double / Imperial Stout"
    beer_2.abv = "12.00%"
    beer_2.brewery = "Toppling Goliath Brewing Company"
    beer_2.url = "https://www.beeradvocate.com/beer/profile/23222/78820/"
    beer_2.ba_score = "100"

    beer_3 = self.new
    beer_3.name = "Mornin' Delight"
    beer_3.style = "American Double / Imperial Stout"
    beer_3.abv = "12.00%"
    beer_3.brewery = "Toppling Goliath Brewing Company"
    beer_3.url = "https://www.beeradvocate.com/beer/profile/23222/76421/"
    beer_3.ba_score = "100"

    [beer_1, beer_2, beer_3]
  end
end
