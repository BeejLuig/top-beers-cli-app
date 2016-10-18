class TopBeers::Style
  attr_accessor :beers
  attr_reader :name

  @@all = []

  def initialize(name)
    @beers = []
    @name = name
    @@all << self
  end

  def self.find_or_create_by_name(name)
    style = @@all.detect {|b| b.name.downcase == name.downcase}
    if style.nil?
      style = self.new(name)
    end
    style
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

  def self.all
    @@all
  end
end
