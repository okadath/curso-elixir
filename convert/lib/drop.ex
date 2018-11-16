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

#usando case para toda la funcion con el guard when
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
#un ejemplo con los cases dentro
#def fall_velocity(planemo, distance) do
#gravity = case planemo do
#:earth when distance >= 0 -> 9.8
#:moon when distance >= 0 -> 1.6
#:mars when distance >= 0 -> 3.71
#end
#:math.sqrt(2 * gravity * distance)
#end
@doc """
usando un case en una variable y un cond para asignar velocity

"""
    def fall_velocity4(planemo, distance) when distance >= 0 do
        gravity = case planemo do
        :earth -> 9.8
        :moon -> 1.6
        :mars -> 3.71
        _ -> 1
        end
    #if gravity==1 do IO.puts "shit" end 
# hacen lo mismo 
#    a=case gravity do
#        1.6 -> "es uno punto seis...luna"
#         1 -> "no se que me diste"
#    end
#    
#     a=cond do
#        gravity == 0 -> "es uno punto seis...luna"
#        gravity < 5 -> "no se que me diste"
#    end

#    IO.puts a
    velocity = :math.sqrt(2 * gravity * distance)
    cond do
        velocity == 0 -> :stable
        velocity < 5 -> :slow
        velocity >= 5 and velocity < 10 -> :moving
        velocity >= 10 and velocity < 20 -> :fast
        velocity >= 20 -> :speedy
    end
    end
end
#ifs 
#if x>10 do :large else :small end
#if x>10, do: :large, else: :small

#esta medio extraño, pero el compilador no permite dentro del case
# o del cond enlazar variables, eso lo hace en si la condicion
# la asignacion o se hace al definir la condicional o no se hace
# supongo que para evitar problemas por malas variables

#imprimir
#IO.inspect para no string
#IO.write sin salto de linea
#IO.puts con salto de linea
#puts no se usa dentro de guards por seguridad

