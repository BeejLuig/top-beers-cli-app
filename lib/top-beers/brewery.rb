class TopBeers::Brewery
  attr_accessor :location, :website, :beers
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
    @beers.each.with_index(1) do |beer, i|
      puts "#{i}. ".colorize(:light_yellow)+"#{beer.name} - #{beer.style}".colorize(:light_green)
    end
    puts "\n"
  end

  def self.all
    @@all
  end
end
