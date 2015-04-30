module BuzonLegal
  class Expediente
    attr_accessor :expediente, :juicio, :actores, :acuerdo

    def initialize(args)
      self.expediente = args[:expediente]
      self.juicio = args[:juicio]
      self.actores = args[:actores]
      self.acuerdo = args[:acuerdo]
    end
  end
end
