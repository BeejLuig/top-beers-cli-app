# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'top-beers/version'

Gem::Specification.new do |spec|
  spec.name          = "top_beers"
  spec.version       = TopBeers::VERSION
  spec.authors       = ["BJ Cantlupe"]
  spec.email         = ["bjcantlupe@gmail.com"]

  spec.summary       = %q{A CLI app for the world's top beers}
  spec.description   = %q{This app scrapes from Beer Advocates website to display the world's top 250 beers. The user can interact with the CLI to learn more information about each beer, including detailed descriptions, brewery information and ABV.}
  spec.homepage      = "https://github.com/BeejLuig/top-beers-cli-app"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry"

  spec.add_dependency "nokogiri"
end
