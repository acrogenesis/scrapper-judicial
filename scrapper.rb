require 'mechanize'
require_relative 'expediente'
module BuzonLegal
  class Scrapper
    attr_accessor :expedientes
    def initialize(date = (Date.today - 1).strftime('%d-%m-%Y'))
      mechanize = Mechanize.new
      self.expedientes = []
      page = mechanize.get('http://cjj.gob.mx/consultas/boletin')
      form = page.forms.first
      form['data[Boletin][txtbusqueda]'] = date
      form['data[Boletin][tipo]'] = 1
      options = form.fields[2].options
      options.each do |option|
        form['data[Boletin][juzgado]'] = option.value
        data = form.submit
        table = data.search('table.twelve')
        uls = table.search('ul.tabs-content')
        dls = uls.search('dl')
        dls.each do |dl|
          dd = dl.search('dd')
          expedientes << Expediente.new(expediente: dd[0].content.strip, juicio: dd[1].content.strip,
                                        actores: dd[2].content.strip, acuerdo: dd[3].content.strip)
        end
      end
    end
  end
end
