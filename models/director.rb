class Director < ActiveRecord::Base
  belongs_to :pelicula

  def self.resumen_combo(limite)
    aux = Director.all.group(:nombre).count.to_a
    aux.delete_if {|x| x[1] < limite}
  end
end