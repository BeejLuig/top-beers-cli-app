class TopBeers::Style
  attr_reader :name, :beers

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
    puts "\n"+"-"*"#{@name}".length
    puts "#{@name}"
    puts "-"*"#{@name}".length
    @beers.each.with_index(1) do |beer, i|
      puts "#{i}. #{beer.name} - #{beer.brewery.name}"
    end
  end

  def self.all
    @@all.sort_by! {|e| e.name}
  end
end
