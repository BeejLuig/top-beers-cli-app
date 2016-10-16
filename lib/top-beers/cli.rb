class TopBeers::CLI
  attr_accessor :beers

  def call
    TopBeers::Scraper.scrape_beers
    list_beers
    menu
    goodbye
  end

  def list_beers
    puts "Beer Advocate's Best Beers in the World"
    @beers = TopBeers::Beer.all
    @beers.each.with_index(1) do |beer, i|
      puts "#{i}. #{beer.name} - #{beer.brewery} \n  #{beer.style} / #{beer.abv}"
    end
  end

  def menu
    input = nil
    while input != "exit"
      puts "Enter the number of the beer you want more information about or type list to see the beer list again or type exit to leave the program"
      input = gets.strip.downcase

      if input.to_i > 0
        beer = @beers[input.to_i - 1]
        puts "#{beer.name} \n"
        puts "Brewed by: #{beer.brewery} \n"
        puts "Style: #{beer.style} \n"
        puts "Alcohol by volume (ABV): #{beer.abv} \n"
        puts "Beer Advocate Score: 100 \n"
        puts "Availability: Rotating \n"
        puts "Description: \n Brewed with Monson’s own Maxwell Road Maple Grade A Dark Amber Maple syrup, Good Morning pours pitch black in the glass with a creamy mousse-like head. The bubbles give way to aromas of rich milk chocolate, cocoa powder, and dark amber maple syrup. The flavor starts as a blast of milk chocolate, sweet maple syrup, and rich fresh coffee as deeper complexities are uncovered as it warms. The crew here at Tree House tastes “chocolate covered maple candy”, “vanilla”, “chocolate cake”, “brown sugar”, and “fresh roasted coffee”. A super decadent treat, Good Morning begs to be shared and contemplated!"
      elsif input == "list"
        list_beers
      elsif input == "exit"
      else
        puts "Not sure what you want. Type list or exit."
      end
    end
  end

  def goodbye
    puts "Thanks for using TopBeers!"
  end
end
