class TopBeers::Brewery
  attr_accessor :location_1, :location_2, :website, :beers
  attr_reader :name

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
    puts "\n"+"-"*"#{@name}'s Beers in the Top 250".length
    puts "#{@name}'s Beers in the Top 250"
    puts "-"*"#{@name}'s Beers in the Top 250".length
    @beers.each.with_index(1) do |beer, i|
      puts "#{i}. #{beer.name} - #{beer.style.name}"
    end
    puts "\n"
  end

  def location
    if @location_2.nil?
      "#{@location_1}"
    else
      "#{@location_1}, #{@location_2}"
    end
  end

  def self.all
    @@all
  end
end
