class TopBeers::CLI
  attr_accessor :beers, :breweries, :beer_list_count, :styles

  def call
    TopBeers::Scraper.scrape_beers
    @beers = TopBeers::Beer.all
    @breweries = TopBeers::Brewery.all
    @styles = TopBeers::Style.all
    @beer_list_count = 1
    list_beers
    beers_menu
  end

  def list_beers
    puts "\n---------------------------------------"
    puts "Beer Advocate's Best Beers in the World"
    puts "---------------------------------------"

    if @beer_list_count > 25
      i = @beer_list_count - 1
      @beer_list_count = 1
      i.times do
        beer = @beers[beer_list_count - 1]
        puts "#{@beer_list_count}. #{beer.name} - #{beer.brewery.name} - #{beer.style.name}"
        @beer_list_count += 1
      end
    else
      25.times do
        beer = @beers[beer_list_count - 1]
        puts "#{beer_list_count}. #{beer.name} - #{beer.brewery.name} - #{beer.style.name}"
        @beer_list_count += 1
      end
    end
  end

  def list_all_beers
    @beers.each.with_index(1) do |beer, i|
      puts "#{i}. #{beer.name} - #{beer.brewery.name} - #{beer.style.name}"
    end
  end

  def more_beers
    if @beer_list_count >= @beers.length
      puts "There are no more beers to list"
    else
      25.times do
        beer = @beers[beer_list_count - 1]
        puts "#{beer_list_count}. #{beer.name} - #{beer.brewery.name} - #{beer.style.name}"
        @beer_list_count += 1
      end
    end
  end

  def list_breweries
    puts "\n------------------------------------"
    puts "Breweries with the World's Top Beers"
    puts "------------------------------------"
    puts
    @breweries.each.with_index(1) do |brewery, i|
      puts "#{i}. #{brewery.name}"
    end
  end

  def list_styles
    puts "\n------------------------------------"
    puts "Styles with the World's Top Beers"
    puts "------------------------------------"
    puts
    @styles.each.with_index(1) do |style, i|
      puts "#{i}. #{style.name}"
    end
  end

  def display_beer_detail(beer)
    puts "-"*"#{@beers.index(beer)+1}".length+"-"*"#{beer.name}".length+"--"
    puts "#{@beers.index(beer)+1}. #{beer.name} \n"
    puts "-"*"#{@beers.index(beer)+1}".length+"-"*"#{beer.name}".length+"--"
    puts "Brewed by".underline + ": #{beer.brewery.name}\n"
    puts "Location".underline + ": #{beer.brewery.location}"
    puts "Website".underline + ": #{beer.brewery.website}"
    puts "Style".underline + ": #{beer.style.name} \n"
    puts "Alcohol by volume (ABV)".underline + ": #{beer.abv} \n"
    puts "Beer Advocate Score".underline + ": #{beer.ba_score} \n"
    puts "Availability".underline + ": #{beer.availability} \n"
    puts "Description".underline + ": #{beer.description}"
  end

  def beers_menu
    input = nil
    while input != "exit"
      puts "\nSelect a beer by " + "number".colorize(:light_red) + ", see " + "more".colorize(:light_red) + " beers, see the " + "list".colorize(:light_red) + " of beers again from the top, see a list of " + "breweries".colorize(:light_red) + " , see a list of " + "styles".colorize(:light_red) + ", or " + "exit".colorize(:light_red) + "."
      input = gets.strip.downcase

      if input.to_i > 0 && input.to_i <= @beers.length
        beer = @beers[input.to_i - 1]
        if beer.description.nil?
          TopBeers::Scraper.scrape_details(beer)
        end
        display_beer_detail(beer)
      else
        case input
        when "list" || "beers"
          list_beers
        when "breweries"
          list_breweries
          brewery_menu
        when "more"
          more_beers
        when "styles"
          list_styles
          style_menu
        when "help"
          help
        when "all"
          list_all_beers
        when "reset"
          reset_beer_counter
          list_beers
        when "exit"
          abort(goodbye)
        else
          puts "Not sure what you want. Type list or exit."
        end
      end
    end
  end

  def brewery_menu
    input = nil
    while input != "exit"
      puts "\nSelect a brewery by " + "number".colorize(:light_red) + ", see the " + "list".colorize(:light_red) + " of breweries again, return to the main " + "menu".colorize(:light_red) + ", or " + "exit".colorize(:light_red) + "."
      input = gets.strip.downcase

      if input.to_i > 0 && input.to_i <= @breweries.length
        brewery = @breweries[input.to_i - 1]
        brewery.show_beers
        brewery_details_menu(brewery)
      elsif input == "list"
        list_breweries
      elsif input == "menu"
        list_beers
        beer_menu
      elsif input == "exit"
        abort(goodbye)
      else
        puts "Not sure what you want. Type list or exit."
      end
    end
  end

  def brewery_details_menu(brewery)
    input = nil
    while input != "exit"
      puts "\nSelect a beer by " + "number".colorize(:light_red) + ", see the " + "list".colorize(:light_red) + " of beers again, see a list of " + "breweries".colorize(:light_red) + " again, return to the main " + "menu".colorize(:light_red) + ", or " + "exit".colorize(:light_red) + "."
      input = gets.strip.downcase

      if input.to_i > 0 && input.to_i <= brewery.beers.length
        beer = brewery.beers[input.to_i - 1]
        if beer.description.nil?
          TopBeers::Scraper.scrape_details(beer)
        end
        display_beer_detail(beer)
      elsif input == "list"
        brewery.show_beers
      elsif input == "menu"
        list_beers
        beer_menu
      elsif input == "breweries"
        list_breweries
        brewery_menu
      elsif input == "exit"
        abort(goodbye)
      else
        puts "Not sure what you want. Type list or exit."
      end
    end
  end

  def style_menu #TODO: refactor for TopBeers::Style
    input = nil
    while input != "exit"
      puts "\nSelect a style by " + "number".colorize(:light_red) + ", see the " + "list".colorize(:light_red) + " of styles again, return to the main " + "menu".colorize(:light_red) + ", or " + "exit".colorize(:light_red) + "."
      input = gets.strip.downcase

      if input.to_i > 0 && input.to_i <= @styles.length
        style = @styles[input.to_i - 1]
        style.show_beers
        style_details_menu(style)
      elsif input == "list"
        list_breweries
      elsif input == "menu"
        list_beers
        beer_menu
      elsif input == "exit"
        abort(goodbye)
      else
        puts "Not sure what you want. Type list or exit."
      end
    end
  end

  def style_details_menu(style) #TODO: refactor for TopBeers::Style
    input = nil
    while input != "exit"
      puts "\nSelect a beer by " + "number".colorize(:light_red) + ", see the " + "list".colorize(:light_red) + " of beers again, see a list of " + "breweries".colorize(:light_red) + " again, return to the main " + "menu".colorize(:light_red) + ", or " + "exit".colorize(:light_red) + "."
      input = gets.strip.downcase

      if input.to_i > 0 && input.to_i <= style.beers.length
        beer = style.beers[input.to_i - 1]
        if beer.description.nil?
          TopBeers::Scraper.scrape_details(beer)
        end
        display_beer_detail(beer)
      elsif input == "list"
        style.show_beers
      elsif input == "menu"
        list_beers
        menu
      elsif input == "breweries"
        list_breweries
        brewery_menu
      elsif input == "exit"
        abort(goodbye)
      else
        puts "Not sure what you want. Type list or exit."
      end
    end
  end

  def help
    puts "\n-------------------------"
    puts "TopBeers List of Commands"
    puts "-------------------------"
    puts "Menu selection".underline + ":"
    puts "beers".colorize(:light_red) + " displays the list of top beers, 25 at a time, up to 250"
    puts "breweries".colorize(:light_red) + " displays the list of top breweries"
    puts "beers".colorize(:light_red) + " displays the list of top styles"
    puts "\nFrom the Beers menu".underline + ":"
    puts "more".colorize(:light_red) + " lists 25 more beers from the current point in the list"
    puts "all".colorize(:light_red) + " lists all 250 beers"
    puts "reset".colorize(:light_red) + " shows the top 25 beers"
    puts "\nFrom any menu".underline + ":"
    puts "[number]".colorize(:light_red) + " selects an item with the corresponding number from the given menu"
    puts "list".colorize(:light_red) + " displays the list of the current menu."
    puts "exit".colorize(:light_red) + " leaves the application"
  end

  def goodbye
    "Thanks for using TopBeers!"
  end

end
