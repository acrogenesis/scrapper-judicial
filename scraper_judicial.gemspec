# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'scraper_judicial/version'

Gem::Specification.new do |spec|
  spec.name          = 'scraper_judicial'
  spec.version       = ScraperJudicial::VERSION
  spec.authors       = ['Adrian Rangel']
  spec.email         = ['adrian.rangel@gmail.com']

  spec.summary       = 'Scraper de Boletines Judiciales en México'
  spec.description   = 'Scraper de Boletines Judiciales en México'
  spec.homepage      = 'https://github.com/acrogenesis/scraper-judicial'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'mechanize', '~> 2.7'

  spec.add_development_dependency 'bundler', '~> 1.9'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'irbtools', '~> 2.0'
end
