#Avi's How to Build a CLI Gem

1. Plan your gem, imagine your interface
2. Start with project structure - google (creating gems with bundler)
3. Start with the entry point - the file run
4. Force that to build the CLI interface
5. Stub out the interface
6. Start making things real
7. Discover objects
8. Program

#How should the program work?
- a command line interface for the world's top beers, using Beer Advocate's Top 250

user types top-beers

Show a list of beers (maybe first 10 or 20)
for example:
1. Good Morning - Tree House Brewing Company
American Double / Imperial Stout / 8.40% ABV

2. Kentucky Brunch Brand Stout - Toppling Goliath Brewing Company
American Double / Imperial Stout / 12.00% ABV

3. Mornin' Delight - Toppling Goliath Brewing Company
American Double / Imperial Stout / 12.00% ABV

Which beer would you like to learn more about? (include options to list or exit, or see more beers)

1

Good Morning

BA SCORE
100
world-class
203 Reviews

THE BROS
99
world-class

BEER INFO

Brewed by:
Tree House Brewing Company
Massachusetts, United States
treehousebrew.com

Style: American Double / Imperial Stout

Alcohol by volume (ABV): 8.40%

Availability: Rotating

Notes / Commercial Description:
Brewed with Monson’s own Maxwell Road Maple Grade A Dark Amber Maple syrup, Good Morning pours pitch black in the glass with a creamy mousse-like head. The bubbles give way to aromas of rich milk chocolate, cocoa powder, and dark amber maple syrup. The flavor starts as a blast of milk chocolate, sweet maple syrup, and rich fresh coffee as deeper complexities are uncovered as it warms. The crew here at Tree House tastes “chocolate covered maple candy”, “vanilla”, “chocolate cake”, “brown sugar”, and “fresh roasted coffee”. A super decadent treat, Good Morning begs to be shared and contemplated!

## maybe add reviews? possibly an option for brewery info? ##

gives option to dive deeper or go back to the main menu

#Building beer class
has a name
has a style
has an ABV
has a brewery
has a ba_score
has a url

#Brewery class
has a name
has a location
has a website
has many beers

#Reference
here doc - http://blog.jayfields.com/2006/12/ruby-multiline-strings-here-doc-or.html

#Clipboard (for later use)

puts <<-DOC.gsub /^\s*/, ''
  1. Good Morning - Tree House Brewing Company
  American Double / Imperial Stout / 8.40% ABV

  2. Kentucky Brunch Brand Stout - Toppling Goliath Brewing Company
  American Double / Imperial Stout / 12.00% ABV

  3. Mornin' Delight - Toppling Goliath Brewing Company
  American Double / Imperial Stout / 12.00% ABV

DOC

#######################################################

beer_1 = self.new
beer_1.name = "Good Morning"
beer_1.style = "American Double / Imperial Stout"
beer_1.abv = "8.40%"
beer_1.brewery = "Tree House Brewing Company"
beer_1.url = "https://www.beeradvocate.com/beer/profile/28743/136936/"
beer_1.ba_score = "100"

beer_2 = self.new
beer_2.name = "Kentucky Brunch Brand Stout"
beer_2.style = "American Double / Imperial Stout"
beer_2.abv = "12.00%"
beer_2.brewery = "Toppling Goliath Brewing Company"
beer_2.url = "https://www.beeradvocate.com/beer/profile/23222/78820/"
beer_2.ba_score = "100"

beer_3 = self.new
beer_3.name = "Mornin' Delight"
beer_3.style = "American Double / Imperial Stout"
beer_3.abv = "12.00%"
beer_3.brewery = "Toppling Goliath Brewing Company"
beer_3.url = "https://www.beeradvocate.com/beer/profile/23222/76421/"
beer_3.ba_score = "100"

##
beers = doc.search(".hr_bottom_light[@align='left']")
beers.each.with_index do |beer, i|
  if i.even?
    new_beer = TopBeers::Beer.new
    new_beer.url = beers[i].children[0].attributes["href"].value
    new_beer.name = beers[i].css("b").text
    new_beer.brewery = beers[i].css("#extendedInfo a")[0].text
    new_beer.style = beers[i].css("#extendedInfo a")[1].text
    new_beer.abv = beers[i].css("#extendedInfo").children[3].text[3, 10]
##
