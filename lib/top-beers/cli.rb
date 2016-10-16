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
      puts "#{i}. #{beer.name} - #{beer.brewery} \n  #{beer.style} / #{beer.abv} ABV"
    end
  end

  def menu
    input = nil
    while input != "exit"
      puts "Enter the number of the beer you want more information about or type list to see the beer list again or type exit to leave the program"
      input = gets.strip.downcase

      if input.to_i > 0
        beer = @beers[input.to_i - 1]
        TopBeers::Scraper.scrape_details(beer)
        puts "#{beer.name} \n"
        puts "Brewed by: #{beer.brewery} \n"
        puts "Style: #{beer.style} \n"
        puts "Alcohol by volume (ABV): #{beer.abv} \n"
        puts "Beer Advocate Score: #{beer.ba_score} \n"
        puts "Availability: #{beer.availability} \n"
        puts "Description: \n#{beer.description}"
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
