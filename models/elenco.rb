class Elenco < ActiveRecord::Base
  belongs_to :pelicula

  def self.resumen_combo(limite)
    aux = Elenco.all.group(:nombre).count.to_a
    aux.delete_if {|x| x[1] < limite}
    aux.delete_if {|x| x[0] == ""}
  end

end