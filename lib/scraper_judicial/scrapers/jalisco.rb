module ScraperJudicial
  class Jalisco < Scraper
    def initialize(args = {})
      self.url = 'http://cjj.gob.mx/consultas/boletin'
      super(args)
    end

    def scrap
      form = page.forms.first
      form['data[Boletin][txtbusqueda]'] = date
      form['data[Boletin][tipo]'] = 1
      options = form.fields[2].options
      options.each do |option| # Itera los juzgados
        form['data[Boletin][juzgado]'] = option.value
        puts "Procesando: #{option.text}"
        data = form.submit
        table = data.search('table.twelve')
        uls = table.search('ul.tabs-content')
        dls = uls.search('dl')
        dls.each do |dl|
          dd = dl.search('dd')
          self.expedientes << Expediente.new(expediente: dd[0].content.strip, juicio: dd[1].content.strip,
                                        actores: dd[2].content.strip, acuerdo: dd[3].content.strip)
        end
      end
    end
  end
end
