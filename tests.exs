IO.puts "Hello world from Elixir"
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