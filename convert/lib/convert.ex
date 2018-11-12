defmodule Convert do
import Drop
    def mps_to_mph(mps) do
        2.23693629 * mps
    end
    def mps_to_kph(mps) do
        3.6 * mps
    end

end
defmodule Combined do
#importar solo evita te3ner que escriir el 
#ombre del modulo
import :math, only: [sqrt: 1]
#import :math, except: [sin: 1, cos: 1]
    def height_to_mph(meters) do
    #el operador |> concatena resultados
        Drop.fall_velocity(meters) |> Convert.mps_to_mph
    end
end
