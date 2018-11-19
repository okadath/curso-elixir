
#structs

defprotocol Valid do
@doc "Returns true if data is considered nominally valid"
	def valid?(data)
end

defmodule Planemo do
	defstruct name: :nil, gravity: 0, diameter: 0, distance_from_sun: 0
end

defimpl Valid, for: Planemo do
	def valid?(p) do
		p.gravity >= 0 and p.diameter >= 0 and
		p.distance_from_sun >= 0
	end
end

defmodule Tower do
    defstruct location: "", height: 20, planemo: :earth, name: ""
end
defimpl Valid, for: Tower do
    def valid?(%Tower{height: h, planemo: p}) do
        h >= 0 and p != nil
    end
end

defmodule StructDrop do
	#pasar un struct a una funcion, lo demas es como otras funciones
	# def fall_velocity(t = %Tower{}) do
	# fall_velocity(t.planemo, t.height)
	# end
	#lee los valores directamente del struct
	def fall_velocity(%Tower{planemo: planemo, height: distance}) do
		fall_velocity(planemo, distance)
	end
	def fall_velocity(:earth, distance) when distance >= 0 do
		:math.sqrt(2 * 9.8 * distance)
	end
	def fall_velocity(:moon, distance) when distance >= 0 do
		:math.sqrt(2 * 1.6 * distance)
	end
	def fall_velocity(:mars, distance) when distance >= 0 do
		:math.sqrt(2 * 3.71 * distance)
	end
end



# al parecer si lo tenemos que diseñar en un archivo distintoç
#funciona en iex o en main, no corre lo de abajo en dnd se define el struct
#tower5 = %Tower{planemo: :mars, height: 500, name: "Daga Vallis", location: "Valles Marineris"}
#tower5.name
#%Tower{planemo: p, location: where} = tower5

#StructDrop.fall_velocity(tower5)


#t3 = %Tower{location: "NYC", height: 241, name: "Woolworth Building"}
#inspect t3

defimpl Inspect, for: Tower do
    import Inspect.Algebra
    def inspect(item, _options) do
        metres = concat(to_string(item.height), "m:")
        msg = concat([metres, break, item.name, ",", break,
        item.location, ",", break,
        to_string(item.planemo)])
    end
end