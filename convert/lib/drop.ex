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
end