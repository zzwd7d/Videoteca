class Genero < ActiveRecord::Base
  belongs_to :pelicula

  def self.resumen_combo()
    Genero.all.group(:nombre).count.to_a
  end

  
end