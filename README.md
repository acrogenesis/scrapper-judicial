# ScraperJudicial

Scrapper de Boletines Judiciales en México.
Soportados:
- Jalisco

## Instalación

Agrega esta linea en tu Gemfile:

```ruby
gem 'scraper_judicial'
```

Correo:

    $ bundle

O instalalo tu mismo:

    $ gem install scraper_judicial

## Uso

```ruby
j = ScraperJudicial::Jalisco.new # Crea Objeto
j.scrap # regresa un arreglo de expedientes
```

## Contribuye

1. Fork it ( https://github.com/acrogenesis/scraper_judicial/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
