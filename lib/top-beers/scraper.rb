class TopBeers::Scraper
  @@HOME = "https://www.beeradvocate.com"

  def self.scrape_beers
    doc = Nokogiri::HTML(open("https://www.beeradvocate.com/lists/top/"))
    beers = doc.search(".hr_bottom_light[@align='left']")
    create_beers(beers)
    beers
  end

  def self.create_beers(beers)
    beers.pop
    unique_beers = beers.select.with_index { |beer, i| i.even? }
    unique_beers.each do |beer|
        if beer.css("#extendedInfo").children[3] != nil
          abv = beer.css("#extendedInfo").children[3].text[3, 10].chomp(" ABV")
        end
        TopBeers::Beer.new({
          name: beer.css("b").text,
          url: beer.children[0].attributes['href'].value,
          brewery: beer.css("#extendedInfo a")[0].text,
          style: beer.css("#extendedInfo a")[1].text,
          abv: abv
        })
    end
  end

  def self.scrape_details(beer)
    doc = Nokogiri::HTML(open("https://www.beeradvocate.com"+beer.url))
    ba_score = doc.search('.ba-score').text
    location_1 = "#{doc.search('.break')[1].children[15].text}"

    if location_1 == "Belgium"
      beer.update_beer_info({
        ba_score: ba_score,
        availability: doc.search('.break')[1].children[35].text.strip,
        description: doc.search('.break')[1].children[42].text.gsub(/\n\t\t/, ''),
        location_1: location_1,
        website: doc.search('.break')[1].children[17].text
        })
    else
      beer.update_beer_info({
        ba_score: ba_score,
        availability: doc.search('.break')[1].children[37].text.strip,
        description: doc.search('.break')[1].children[44].text.gsub(/\n\t\t/, ''),
        location_1: location_1,
        location_2: doc.search(".break")[1].children[17].text,
        website: doc.search('.break')[1].children[19].text
        })
    end
  end

end
