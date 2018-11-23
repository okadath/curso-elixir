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
#solo funciona en el interprete iex
#i "hello"
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


#tuplas
tuple={:earth,20}
elem(tuple,1)
new_tuple=put_elem(tuple,1,40)
tuple_size(new_tuple)

#no se si iniciar mi tarea con este lenguaje

#https://elixirforum.com/t/how-to-make-a-chat-app-like-whatsapp/5757/20
#



#n="dos"
#result ="asd"
#IO.puts("#{n} yields #{result}.")
#y = {4, 5, 6}
#"y is now #{inspect y}"
#multi = """
#This is a multiline
#string, also called a heredoc.
#"""
# caracteres son mas lentos que strings 
#'el' ++ 'ixir'
#List.to_string('elixir')
#String.to_char_list("elixir")

#sigilos
#~ (tilde)
#s (,binary string)
#c (character list)
#r (regular expression)
#w (lista de palabras usando espacios).
#lowercase,  interpolation y escaping usual.
#uppercase (S, C, R, or W), como se ve no escaping o interpolation.
#p = ~S"es {#msg} \n solo un {#msg}."





##me quede en los sigils=========================

#si uno usa el puts directamente decuele todo unido
#en el iex si devuelve el array
~w/Elixir is great!/

defmodule Drop do
	def fall_velocity({planemo, distance}) when distance >= 0 do
		fall_velocity(planemo, distance)
	end
	defp fall_velocity(:earth, distance) do
		:math.sqrt(2 * 9.8 * distance)
	end
	defp fall_velocity(:moon, distance) do
		:math.sqrt(2 * 1.6 * distance)
	end
	defp fall_velocity(:mars, distance) do
		:math.sqrt(2 * 3.71 * distance)
	end
end

defmodule Ask do
	def line() do
		planemo=get_planemo()
		distance=get_distance()
		Drop.fall_velocity({planemo, distance})
	end
	defp get_planemo() do
		IO.puts("""
		Which planemo are you on?
		1. Earth
		2. Earth's Moon
		3. Mars
		""")
		# answer = IO.gets("Which? > ")
		# value=String.first(answer)
		# char_to_planemo(value)
		IO.gets("Which? > ")
		|> String.first()
		|> char_to_planemo()
	end
	defp get_distance() do
		# input = IO.gets("How far? (meters) > ")
		# value = String.strip(input)
		# String.to_integer(value)
		IO.gets("How far? (meters) > ")
		|> String.strip()#String.trim
		|> String.to_integer()
	end
	# defp char_to_planemo(char) do
	# 	case char do
	# 		"1" -> :earth
	# 		"2" -> :moon
	# 		"3" -> :mars
	# 	end
	# end
	defp char_to_planemo("1"), do: :earth
	defp char_to_planemo("2"), do: :moon
	defp char_to_planemo("3"), do: :mars
end
#matchea x y y
[1, x, 4, y] = [1, 2, 4, 8]
insert = [2, 4, 8]
IO.inspect full = [1, insert, 16, 32]
IO.inspect neat = List.flatten(full)
a = [1, 2];b = [8, 16]
#funcionan igual para unir
combined = Enum.concat(a, b)
IO.inspect combined2 = a ++ b
#para concatenar mas de 2 pasar en una lista
c = [64, 128, 256]
IO.inspect combined3 = Enum.concat([a, b, c])

####
#
list = [1, 2, 4]
[h1 | t1] = list
IO.inspect h1;IO.inspect t1
[h3 | t3] = [5]
h3;IO.inspect t3# no tail

#asi se manejan las listas? que horror D:
defmodule Overall do

	def product([]) do
		0
	end

	def product(list) do
		product(list, 1)
	end

	def product([], accumulated_product) do
		accumulated_product
	end

	def product([head | tail], accumulated_product) do
		product(tail, head * accumulated_product)
	end
end

#x = [1 | [2, 3]] es [1, 2, 3]
#y = [1, 2 | [3]] es [1, 2, 3]
#z = [1, 2 | 3] es [1, 2 | 3]  es una lista impropia
#w=[[1,2] | [3]] es [[1,2],3]


defmodule ListDrop do
	def falls(list) do
		falls(list, [])
	end
	def falls([], results) do
		Enum.reverse(results)
	end
	def falls([head|tail], results) do
		falls(tail, [Drop.fall_velocity(head) | results])
	end
end

#TODO es estatico, siempre se crean duplicados
#mezcla las listas en una tupla y lassepara 
list1 = ["Hydrogen", "Helium", "Lithium"]
list2 = ["H", "He", "Li"]
element_list = Enum.zip(list1, list2)
separate_lists = Enum.unzip(element_list)

#keywords lists, es como hashes pero quiza no sean unicos
atomic_weights = [hydrogen: 1.008, carbon: 12.011, sodium: 22.99, carbon: 77] 

#todas las operaciones devuelven algo a lo que se debe igualar 
# aqui no lo igualo por resumir
#si no existe regresa 2, usa simbolos
Keyword.get atomic_weights, :carbon , 2
#fetch! manda error en vez de default
#Keyword.fetch!(atomic_weights, :neon)
#regresa todos los que se llamen igual
Keyword.get_values(atomic_weights , :carbon)
#existe?
Keyword.has_key?(atomic_weights, :neon)
# agrega y si ya existe no hace nada
Keyword.put_new(atomic_weights, :helium, 4.0026)
#agrega y si existe, todas las anteriores se borran 
Keyword.put(atomic_weights , :carbon, 1 )
# como modificar entre los repetidos solo uno dado?

#borrar 
Keyword.delete(atomic_weights, :carbon) 
Keyword.delete_first(atomic_weights, :carbon) 

atomic_info = [{:hydrogen, :H, 1.008}, {:carbon, :C, 12.011},{:sodium, :Na, 22.99}]
#lista, llave, posicion interna a usar, default si no existe
List.keyfind(atomic_info, :H, 1)
List.keyfind(atomic_info, :F, 1,"qwe")
#existe en la lista? lista,llave,posicion
List.keymember?(atomic_info, :Na, 1)
#agrega
List.keystore(atomic_info, :boron, 0,{:boron, :B, 10.081})
#remplaza, puede reemplazar todo
List.keyreplace(atomic_info, :B, 1, {:boron, :B, 10.81})
#borra

IO.inspect a=List.keydelete(atomic_info, :carbon, 0)

#Hashes
planemo_hash = Enum.into([earth: 9.8, moon: 1.6, mars: 3.71], HashDict.new())
s=HashDict.new()
#existe? hash, elemento
IO.inspect HashDict.has_key?(planemo_hash, :jup)

#dame el elemento con default
HashDict.get(planemo_hash, :jupiter, 0)
#si no lo copia es por que se te olvdo que es estatico
#debes crear uno nuevo o usar put
HashDict.put_new(planemo_hash, :jupiter, 99.9)
HashDict.put(planemo_hash, :jupiter, 23.1)
#si no existe nada nos lo indica al borrar
HashDict.delete(planemo_hash, :jupiter)

#mapas =================================================
new_map = %{}
number_map=%{2 => "two", 3 => "three"}
IO.inspect planemo_map = %{earth: 9.8, moon: 1.6, mars: 3.71}  
#modificar, ambos funcionan igual
%{planemo_map | earth: 12} 
#basta con uno, si no existe manda error
%{planemo_map | :earth => 12, :jup => 3} 
#agregar
Map.put_new(planemo_map, :jupiter, 23.1)
#machear con una key, si no existe hay error
%{earth: earth_gravity} = planemo_map

#functions=====================
fall_velocity = fn(distance) -> :math.sqrt(2 * 9.8 * distance) end
#se evalua con un punto
IO.puts fall_velocity.(20)


#funciones que reciben funciones(devuelve el triple de f)
defmodule Hof do
    def tripler(value, function) do
    3 * function.(value)
    end
end

#se puede crear como parametro
#Hof.tripler(6, fn(value) -> 20 * value end)

#funciones ampersand, se define el arg_n con &
ampersand_function = &(20 * &1)
#Hof.tripler(:math.pi, &:math.cos(&1))

#funciones con listas !!!
#se le pasa al enum(lista, funcion) y la funcion(i) lo hace uno por uno
print = fn(value) -> IO.puts(" #{value}") end
list = [1, 2, 4, 8, 16, 32]
Enum.each(list, print)


square = &(&1 * &1)
IO.inspect Enum.map(list, square)
#las lists tambien pueden ser por # arreglo al vuelo
Enum.map(1..3, square)

#compresion de listas 
for value <- list, do: value * value

#filtrado de funciones
#creamos un filtro a partir de condiciones booleanas
four_bits = fn(value) -> (value >= 0) and (value < 16) end
#y se lo pasamos a Enum.filter, este crea un nuevo arreglo∫
Enum.filter(list, four_bits)
#tambien se puede hacer con compresion
asd2=for value <- list, value >= 0, value < 16, do: value


#testing de elementos
#funcion booleana
int? = fn(value) -> is_integer(value) end
#preguntamos si todos cumplen la funcion

Enum.all?(list, int?)
#si por lo menos alguno cumple
Enum.any?(list, int?)

#tambien cn &..... f(x)=x>10
greater_than_ten? = &(&1 > 10)

Enum.all?(list, greater_than_ten?)

Enum.any?(list, greater_than_ten?)

#particionado de listas, tomamos una funcion ylas separa si cumple o no
IO.inspect Enum.partition(list, greater_than_ten?)
#para partir a partir de un elemento dado
test = &(&1 < 4)
#parte y devuelve despues de partir
Enum.drop_while([1, 2, 4, 8, 4, 2, 1], test)
#parte y devuelve antes de partir
Enum.take_while([1, 2, 4, 8, 4, 2, 1], test)


#Folding lists
#se puede usar un acumulador para almacenar algun resultado en funcion de las listas

sumsq = fn(value, accumulator) -> accumulator + value * value end
#foldl y foldr son lo mismo l es tail recursive
#foldl es de head->tail
#foldr es de tail->head
#l es mas rapido ya que no invierte la lista, pero si 
#el orden no importa da igual el que usemos
List.foldl([2, 4, 6], 0, sumsq)

#cuando si importa su orden se obtienen resultados distintos!!!!!




#instalar
#mix archive.install https://github.com/phoenixframework/archives/raw/master/phoenix_new.ez
#
#ejecutar sin base de datos
#mix phoenix.new fall --no-brunch --no-ecto
#
#correr desde iex
#cd fall
#iex -S mix phoenix.server





