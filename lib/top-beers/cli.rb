class TopBeers::CLI
  def call
    puts "Beer Advocate's Best Beers in the World"
    list_beers
    menu
  end

  def list_beers
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
  end
end
