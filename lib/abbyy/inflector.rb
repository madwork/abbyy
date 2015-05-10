module Abbyy::Inflector
  def camelize(str)
    str[0,1] << str.split('_').map{|w| w.capitalize}.join[1..-1]
  end
end
