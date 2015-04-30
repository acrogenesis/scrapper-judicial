require 'mechanize'
require_relative 'expediente'
module BuzonLegal
  class Scrapper
    attr_accessor :page, :expedientes
    def initialize(args)
      self.page = Mechanize.new.get(args[:url])
      self.date = args[:date] || (Date.today - 1).strftime('%d-%m-%Y')
      self.expedientes = []
    end

    def expedientes
      fail 'Tienes que implementar el metodo expedientes'
    end
  end
end
