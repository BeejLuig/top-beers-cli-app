# Specifications for the CLI Assessment

Specs:
- [x] Have a CLI for interfacing with the application - cli.rb includes all methods pertaining to interface display and user interaction. The only exception is #show_beers in brewery.rb and style.rb
- [x] Pull data from an external source - scraper.rb includes two scraping methods. .scrape_beers pulls data from 'https://www.beeradvocate.com/lists/top/' and .scrape_details pulls from the :url instance variable owned by a given TopBeers::Beer instance.
- [x] Implement both list and detail views - There are list views for beers, breweries, and styles. From the beers menu, inputting a number will display a detail view. The brewery and style menus go down two levels. Select a brewery/style and get another list view of related beers. Select a beer by number to get the details.
