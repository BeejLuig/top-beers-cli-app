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
