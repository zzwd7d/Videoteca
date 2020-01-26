def junta(x, sep='|')
  res = ""

  x.each do |n|
    if res != ""
      res = res + " " + sep + " "
    end
    res = res + n.nombre
  end

  res

end

def junta2(x, sep='|',sep2='>')
  res = ""

  x.each do |n|
    if res != ""
      res = res + " " + sep + " "
    end
    res = res + n.nombre + sep2 + n.personaje
  end

  res

end

def arma2(x, sep='|', sep2='>')
  res = ""

  x.each do |n|
    if res != ""
      res = res + sep
    end
    res = res + n[0] + sep2 + n[1]
  end

  res

end

def separa(x, sep='|')
  aux = x.split(sep)
  res = []
  aux.each do |cada|
    res << cada.strip
  end
  res
end

def separa2(x, sep='|', sep2='>')
  aux = x.split(sep)
  res = []
  aux.each do |cada|
    aux2 = cada.split(sep2)
    res2 = []
    aux2.each do |uno|
      res2 << uno.strip
    end
    res << res2
  end
  res
end

def es_completa

  @error_msg = " "
  if @peli.titulo == ""
    @error_msg = "Debe informarse un titulo"
  elsif @peli.anio == ""
    @error_msg = "Debe informarse un ano"
  elsif @peli.anio.to_i <= 0
    @error_msg = "El ano debe ser numerico"
  elsif @peli.titulo_original == ""
    @error_msg = "Debe informarse un titulo original"
  elsif @peli.formato == "N/A"
    @error_msg = "Debe informarse un formato"
  elsif @peli.media == "N/A"
    @error_msg = "Debe informarse el medio"
  end

  if @error_msg == " "
    ret = true
  else
    ret = false
  end

  ret

end

def modo
    salida = "consulta"
    if @Modo == "ALTA"
      salida = "entrada"
    end
    salida
end

def modif
  salida = ""
  if @Modo == "CONSULTA"
    salida = "readonly"
  end
  salida
end

def tdcolor( n )
  salida = case n.divmod(5)[1]
                when 0 then "color1"
                when 1 then "color2"
                when 2 then "color3"
                when 3 then "color4"
                when 4 then "color5"
           end
  salida
end