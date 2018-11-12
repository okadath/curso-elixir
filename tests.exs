IO.puts "Hello world "<>"from Elixir"#concatena strings
IO.puts String.length("hellö")
IO.puts div(10, 2)
 list = [1, 2, 3]
 IO.puts hd (list)
 tl(list)
 #i list
 #'asd' charlist "asd" string
#tuple=File.read("aa.txt")

#IO.puts elem(tuple, 0)
#IO.puts elem(tuple, 1)
suma = fn (valor1, valor2) -> valor1 + valor2 end
IO.puts suma.(10, 20)

defmodule Calculadora do

  def suma(val1, val2) do
    val1 + val2
  end

end
IO.puts Calculadora.suma(2,2)
#[1, 2, 3] ++ [4, 5, 6]#++ agrega -- elimina
[a, b, c] = [1, 2, 3]
IO.puts a
list=[1, 2, 3]
[head | tl] = list
d=[0 | list]
IO.puts head #<>d
#me parece que el pattern matching solo 
#fija los valores de las variables, las estructuras
#son fijas, _ es para indicar que no importa lo de 
#ese lado es solo para completar
 [h | _] = [1, 2, 3]
#el lenguaje esta loco 
a=10
10=a #es legal!!!
#para matchear en vez de asignar se usa ^var
[b, 10] = [20, a]
case {1, 2, 3} do
{4, 5, 6} ->
"This clause won't match"
{1, x, 3} ->
IO.puts x#matchea aqui a 2
 
 _ ->
"This clause would match any value"
end
#la programacion funcional hace pattern matching
#permite "forzar" valores para completar la sentencia

:math.sin 0
:math.pow 2,17
i "hello"
#metodos privados defp
#anon func 
fall_velocity= fn (distance) -> :math.sqrt(2 * 9.8 * distance) end
#nuevo proyecto
#mix new first_app
#abrir cosola
#iex -S mix
#nuevo modulo 
#mix new direccion --app modulo
#si hay cambios dsde iex :
#recompile

