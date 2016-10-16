class TopBeers::Scraper
  @@HOME = "https://www.beeradvocate.com"

  def self.scrape_beers
    doc = Nokogiri::HTML(open("https://www.beeradvocate.com/lists/top/"))
    beers = doc.search(".hr_bottom_light[@align='left']")
    self.create_beers(beers)
    beers
  end

  def self.create_beers(beers)
    beers.pop
    i = 0
    beers.each do |beer|
      if i.even?
        new_beer = TopBeers::Beer.new(beer.css("b").text)
        new_beer.url = beer.children[0].attributes['href'].value
        new_beer.brewery = TopBeers::Brewery.find_or_create_by_name(beer.css("#extendedInfo a")[0].text)
        new_beer.style = beer.css("#extendedInfo a")[1].text
        if beer.css("#extendedInfo").children[3] != nil
          new_beer.abv = beer.css("#extendedInfo").children[3].text[3, 10].chomp(" ABV")
        end
      end
      i += 1
    end
  end

  def self.scrape_details(beer)
    doc = Nokogiri::HTML(open("https://www.beeradvocate.com"+beer.url))
    beer.ba_score = doc.search(".ba-score").text
    beer.availability = doc.search(".break")[1].children[37].text.strip
    beer.description = doc.search(".break")[1].children[44].text.gsub(/\n\t\t/, '')
  end
end

#ba_score = doc.search(".ba-score").text
 #=> "100"

# description = doc.search(".break")[1].children[44].text
# availability = doc.search(".break")[1].children[37].text
# location_1 = doc.search(".break")[1].children[15].text
# location_2 = doc.search(".break")[1].children[17].text
# brew_site = doc.search(".break")[1].children[19].text
