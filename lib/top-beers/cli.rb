class TopBeers::CLI
  attr_accessor :beers, :breweries, :beer_list_count

  def call
    TopBeers::Scraper.scrape_beers
    @beers = TopBeers::Beer.all
    @breweries = TopBeers::Brewery.all
    @beer_list_count = 1
    list_beers
    menu
    goodbye
  end

  def list_beers
    puts "---------------------------------------".colorize(:yellow)
    puts "Beer Advocate's Best Beers in the World".colorize(:light_yellow)
    puts "---------------------------------------".colorize(:yellow)

    if @beer_list_count > 25
      i = @beer_list_count - 1
      @beer_list_count = 1
      i.times do
        beer = @beers[beer_list_count - 1]
        puts "#{@beer_list_count}. ".colorize(:light_yellow)+"#{beer.name} - #{beer.brewery.name} - #{beer.style}".colorize(:light_green)
        @beer_list_count += 1
      end
    else
      25.times do
        beer = @beers[beer_list_count - 1]
        puts "#{beer_list_count}. ".colorize(:light_yellow)+"#{beer.name} - #{beer.brewery.name} - #{beer.style}".colorize(:light_green)
        @beer_list_count += 1
      end
    end
  end

  def more_beers
    if @beer_list_count >= @beers.length
      puts "There are no more beers to list"
    else
      25.times do
        beer = @beers[beer_list_count - 1]
        puts "#{beer_list_count}. ".colorize(:light_yellow)+"#{beer.name} - #{beer.brewery.name} - #{beer.style}".colorize(:light_green)
        @beer_list_count += 1
      end
    end
  end

  def list_breweries
    @breweries.each.with_index(1) do |brewery, i|
      puts "#{i}. ".colorize(:light_yellow)+"#{brewery.name}".colorize(:light_green)
    end
    puts "\n"
  end

  def display_beer_detail(beer)
    puts "#{beer.name} \n"
    puts "Brewed by: #{beer.brewery.name} \n"
    puts "Location: #{beer.brewery.location}"
    puts "Website: #{beer.brewery.website}"
    puts "Style: #{beer.style} \n"
    puts "Alcohol by volume (ABV): #{beer.abv} \n"
    puts "Beer Advocate Score: #{beer.ba_score} \n"
    puts "Availability: #{beer.availability} \n"
    puts "Description: \n#{beer.description}"
    puts "\n"
  end

  def menu
    input = nil
    while input != "exit"
      puts "\nEnter the ".colorize(:light_yellow) + "number".colorize(:light_red) + " of the beer you want more information about.".colorize(:light_yellow) + "\nType " + "more".colorize(:light_red) + " to see more beers, " + "list".colorize(:light_red) + " to see the list from the top, " + "breweries".colorize(:light_red) + " for a list of breweries, or " + "exit".colorize(:light_red) + " to quit."
      input = gets.strip.downcase

      if input.to_i > 0 && input.to_i <= @beers.length
        beer = @beers[input.to_i - 1]
        if beer.description.nil?
          TopBeers::Scraper.scrape_details(beer)
        end
        display_beer_detail(beer)
      elsif input == "list"
        list_beers
      elsif input == "breweries"
        list_breweries
        brewery_menu
      elsif input == "more"
        more_beers
      elsif input == "exit"
      else
        puts "Not sure what you want. Type list or exit."
      end
    end
  end

  def brewery_menu
    input = nil
    while input != "exit"
      puts "Enter the number of the brewery you want to see the list of beers for.\nType list to see the list again, or exit to return to the main menu."
      input = gets.strip.downcase

      if input.to_i > 0 && input.to_i <= @breweries.length
        brewery = @breweries[input.to_i - 1]
        brewery.show_beers
        brewery_details_menu(brewery)
      elsif input == "list"
        list_breweries
      elsif input == "exit"
      else
        puts "Not sure what you want. Type list or exit."
      end
    end
  end

  def brewery_details_menu(brewery)
    input = nil
    while input != "exit"
      puts "Enter the number of the beer you want to see the list of beers for.\nType list to see the list again, or exit to return to the breweries menu."
      input = gets.strip.downcase

      if input.to_i > 0 && input.to_i <= brewery.beers.length
        beer = brewery.beers[input.to_i - 1]
        if beer.description.nil?
          TopBeers::Scraper.scrape_details(beer)
        end
        display_beer_detail(beer)
      elsif input == "list"
        brewery.show_beers
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
