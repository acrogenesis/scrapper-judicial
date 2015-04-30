module ScraperJudicial
  class Scraper
    attr_accessor :page, :expedientes, :url, :date
    def initialize(args)
      fail 'Tienes que especificar un url' if url.nil?
      self.page = Mechanize.new.get(url)
      self.date = args[:date] || (Date.today - 1).strftime('%d-%m-%Y')
      self.expedientes = []
    end

    def scrap
      fail 'Tienes que implementar el metodo expedientes'
    end
  end
end
