class TopBeers::CLI
  attr_accessor :beers

  def call
    TopBeers::Scraper.scrape_beers
    list_beers
    menu
    goodbye
  end

  def list_beers
    puts "#######################################".colorize(:yellow)
    puts "Beer Advocate's Best Beers in the World".colorize(:light_yellow)
    puts "#######################################".colorize(:yellow)
    @beers = TopBeers::Beer.all
    @beers.each.with_index(1) do |beer, i|
      puts "#{i}.".colorize(:light_yellow)+"#{beer.name} #{beer.brewery} - #{beer.style}".colorize(:light_green)
    end
    puts "\n"
  end

  def menu
    input = nil
    while input != "exit"
      puts "Enter the number of the beer you want more information about. Type list to see the list again, or exit to quit."
      input = gets.strip.downcase

      if input.to_i > 0
        beer = @beers[input.to_i - 1]
        if beer.description.nil?
          TopBeers::Scraper.scrape_details(beer)
        end
        puts "#{beer.name} \n"
        puts "Brewed by: #{beer.brewery.name} \n"
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
