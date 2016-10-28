class TopBeers::Brewery
  attr_accessor :location_1, :location_2, :website
  attr_reader :name, :beers

  @@all = []

  def initialize(name)
    @beers = []
    @name = name
    @@all << self
  end

  def self.find_or_create_by_name(name)
    brewery = @@all.detect {|b| b.name.downcase == name.downcase}
    if brewery.nil?
      brewery = self.new(name)
    end
    brewery
  end

  def show_beers
    puts "\n"+"-"*"#{@name}".length
    puts "#{@name}"
    puts "-"*"#{@name}".length
    if @website.nil?
      TopBeers::Scraper.scrape_details(@beers[0])
    end
    puts "Location".underline + ": #{self.location}"
    puts "Website".underline + ": #{@website}"
    puts "Beers in the top 250".underline + ":"
    @beers.each.with_index(1) do |beer, i|
      puts "#{i}. #{beer.name} - #{beer.style.name}"
    end
  end

  def location
    if @location_2.nil?
      "#{@location_1}"
    else
      "#{@location_1}, #{@location_2}"
    end
  end

  def self.all
    @@all.sort_by! { |e| e.name }
  end
end
