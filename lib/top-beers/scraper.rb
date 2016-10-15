class TopBeers::Scraper
  @@HOME = "https://www.beeradvocate.com"

  def self.scrape_beers
    doc = Nokogiri::HTML(open("https://www.beeradvocate.com/lists/top/"))
    beers = scraper.search(".hr_bottom_light[@align='left']")

    #need to wrap in a loop
    #url = beers[0].children[0].attributes["href"].value
    #name = beers[0].css("b").text
    #brewery = beers[0].css("#extendedInfo a")[0].text
    #style = beers[0].css("#extendedInfo a")[1].text
    #abv = beers[0].css("#extendedInfo").children[3].text[3, 10]
  end
end
