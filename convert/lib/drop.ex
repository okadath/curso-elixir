defmodule Drop do
@moduledoc """
documentacion mierdosa del modulo
"""
@vsn 0.1

@doc """
mierdosa documentacion :v
"""
   #@spec fall_velocity(number(),number()) :: float()
    def fall_velocity(distance, gravity\\ 9.8) do
        :math.sqrt(2 * gravity * distance)
    end
    
    defmodule MathDemo do
        def absolute_value(number) when number < 0 do
        -number
    end
    def absolute_value(number) do
        number
    end
end

#usando case para toda la funcion 
    def fall_velocity2(planemo, distance) when distance >= 0 do
        case planemo do
        :earth -> :math.sqrt(2 * 9.8 * distance)
        :moon -> :math.sqrt(2 * 1.6 * distance)
        :mars -> :math.sqrt(2 * 3.71 * distance)
        _ -> 1.0
        end
    end
    #usando case para asignar una variable
def fall_velocity3(planemo, distance) when distance >= 0 do
gravity = case planemo do
:earth -> 9.8
:moon -> 1.6
:mars -> 3.71
_ -> 1
end
:math.sqrt(2 * gravity * distance)
end

end