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
end