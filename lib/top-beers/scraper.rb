class TopBeers::Scraper
  @@HOME = "https://www.beeradvocate.com"

  def self.scrape_beers
    doc = Nokogiri::HTML(open("https://www.beeradvocate.com/lists/top/"))
    beers = doc.search(".hr_bottom_light[@align='left']")
    i = 0
    beers.pop
    beers.each do |beer|
      if i.even?
        new_beer = TopBeers::Beer.new
        new_beer.url = beer.children[0].attributes['href'].value
        new_beer.name = beer.css("b").text
        new_beer.brewery = beer.css("#extendedInfo a")[0].text
        new_beer.style = beer.css("#extendedInfo a")[1].text
        if beer.css("#extendedInfo").children[3] != nil
          new_beer.abv = beer.css("#extendedInfo").children[3].text[3, 10]
        end
      end
      i += 1
    end
    beers
  end

end
