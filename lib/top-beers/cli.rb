class TopBeers::CLI
  def call
    list_beers
    menu
    goodbye
  end

  def list_beers
    puts "Beer Advocate's Best Beers in the World"
    puts <<-DOC.gsub /^\s*/, ''
      1. Good Morning - Tree House Brewing Company
      American Double / Imperial Stout / 8.40% ABV

      2. Kentucky Brunch Brand Stout - Toppling Goliath Brewing Company
      American Double / Imperial Stout / 12.00% ABV

      3. Mornin' Delight - Toppling Goliath Brewing Company
      American Double / Imperial Stout / 12.00% ABV

    DOC
  end

  def menu
    input = nil
    while input != "exit"
      puts "Enter the number of the beer you want more information about or type list to see the beer list again or type exit to leave the program"
      input = gets.strip.downcase
      case input
      when "1"
        puts "More info on beer 1..."
      when "2"
        puts "More info on beer 2..."
      when "3"
        puts "More info on beer 3..."
      when "list"
        list_beers
      else
        puts "Not sure what you want. Type list or exit."
      end
    end
  end

  def goodbye
    puts "Thanks for using TopBeers!"
  end
end
