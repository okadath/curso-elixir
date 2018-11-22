#errores encerrados en un catch
#try catch
# try do
# 	:math.sqrt(2 * gravity * distance)
# rescue
# 	error -> error
# ArithmeticError -> {:error, "Distance must be non-negative"}
# CaseClauseError -> {:error, "Unknown planemo #{planemo}"}
# end


# [ArithmeticError, CaseClauseError] -> "Generic Error"
#no se como funcione este
# err in [ErlangError, RuntimeError] -> {:error, err}

# en el logger

# :info general
# :debug 
# :warn
# :error

#uso del logger para manejo deinformacion
# require Logger
# counter=255
# Logger.info("About to begin test")
# Logger.debug("Current value of counter is #{counter}")
# Logger.warn("Connection lost; will retry.")
# Logger.error("Unable to read database.")

# generar el alias de un atomo, asi lo manejas con Dbg
# alias :dbg, as: Dbg
#sirve para analizar el paso de mensajes como el observer sin GUI
# :dbg.tracer()
#necesitamos agregar el Mph Drop antes
# pid1 = spawn(MphDrop, :mph_drop, [])
# :dbg.p(pid1, :m)
# send(pid1, {:moon, 20})


defmodule Fact do
	def factorial(n) do
		factorial(1, n, 1)
	end
	defp factorial(current, n, result) when current <= n do
		new_result = result * current
		IO.puts("#{current} yields #{new_result}.")
		factorial(current + 1, n, new_result)
	end
	defp factorial(_current, _n, result) do
		IO.puts("finished!")
		result
	end
end

#sirve tambien para analizar el comportamiento en funciones
#recursivas sin meter prints :v
:dbg.tracer()
#reporta todos los procesos :all,y sus llamadas :c
:dbg.p(:all, :c)
#el nombre del modulo, la funcion comoa atomo yargumentos 
:dbg.tpl(Fact, :factorial, [])
Fact.factorial(4)

# :dbg.stop/0 #reinicia
# :dbg.stop_clear/0 #inicia desde un pu

#++++++++++++++++++++++++++++++++++++Analisis y tests ===================
# Dyalixir 
# instalar:

# git clone https://github.com/jeremyjh/dialyxir
# cd dialyxir
# mix archive.build
#si el anterior da un error es por que faltan paquetes de erlang
# usar el sig comando y volver a correr el de arriba
# mix deps.get

# mix archive.install
# mix dialyzer.plt

# si dice que no lo encuentra correr 
#mix dialyzer

#crea algo llamado Persistent Lookup Table

#con esto corres Dyalizer para analizar errores semanticos
# mix clean
# mix dialyzer
#asi se deben de escribir los test unitarios
# @type planetuple :: {atom(), number()}
# @spec fall_velocity(planetuple, number()) :: float()


#definir test unitarios en la carpeta test de cada proyecto
#esto inicializa el modulo de test unitarios en iex 
ExUnit.start()

defmodule DropTest do
	#usa la libreria de tests, async permite ejecutarlos en paralelo
	use ExUnit.Case, async: true
	#la palabra test describe el test y va con una descripcion
	test "Zero distance gives zero velocity" do
		#sepera true, existe  refute, que espera un false
		assert Drop.fall_velocity(:earth,0) == 0
	end
	test "Mars calculation correct" do
		assert Drop.fall_velocity(:mars, 10) == :math.sqrt(2 * 3.71 * 10)
	end

	#se necesita contexto para algunos tests
	#para eso es lo sigiente
	#los 3 metodos siguientes van juntos en el test
	setup_all do
		IO.puts "Beginning all tests"
		
		on_exit fn ->
			IO.puts "Exit from all tests"
		end

		{:ok, [connection: :fake_PID]}
	end
	#me pareceque con esto lo lanzas y accedes al map
	setup context do
		#context es una variable que psee la info previa requerida del test
		IO.puts "About to start a test. Connection is #{Map.get(context,:connection)}"
		on_exit fn ->
			IO.puts "Individual test complete."
		end
		:ok
	end

	test "Zero  gives zero velocity", context do
		IO.puts "In zero distance test. Connection is #{Map.get(context,
		:connection)}"
		assert Drop.fall_velocity(:earth,0) == 0
	end
end



#los tests se pueden lanzar desde una funcion anonima 
# defmodule Drop4Test do
# 	use ExUnit.Case, async: true
# 	test "Unknown planemo causes error" do
# 		assert_raise CaseClauseError, fn ->
# 			Drop.fall_velocity(:planetX, 10)
# 		end
# 	end
# 	test "Negative distance causes error" do
# 		assert_raise ArithmeticError, fn ->
# 			Drop.fall_velocity(:earth, -10)
# 		end
# 	end
# end


#se ejecuta para evaluar los tests en las carpetas:
# mix test

#los numeros en coma flotante pueden tener errores de precision
#se usa un rango para evaluar el test

#assert_in_delta calculated, 4.4, 0.05, "#{calculated} is not within 0.05 of 4.4"


#podemos definir los tests unitarios en la documentacion, estos son doctests

# defmodule DropTest2 do
# 	use ExUnit.Case, async: true
# 	#debe ser el nombre del modulo
# 	doctest Drop
# end
# asi lucen, habra que revisarlos, no los entiendo del todo
# @doc """
# Calculates speed of a falling object on a given planemo
# (planetary mass object)
# iex(1)> Drop.fall_velocity(:earth, 10)
# 14.0
# iex(2)> Drop.fall_velocity(:mars, 20)
# 12.181953866272849
# iex> Drop.fall_velocity(:jupiter, 10)
# ** (CaseClauseError) no case clause matching: :jupiter
# """


#===============================storing data

#los records son como tuplas par aalmacenar datos
#se pueden almacenar en su propio archivo .ex

defmodule Planemo do
	require Record
		Record.defrecord :planemo, [name: :nil, gravity: 0, diameter: 0,
		distance_from_sun: 0]
	end
defmodule Tower do
	require Record
	#nombre y etiqueta
	Record.defrecord :tower, Tower,
	[location: "", height: 20, planemo: :earth, name: ""]
end

#hay que escribir en la consola: require Tower
# tower5 = Tower.tower planemo: :mars, height: 500,
# name: "Daga Vallis", location: "Valles Marineris"
#Tower.tower(tower5, :planemo)

#o puedes usar el import

# import Tower; tower(tower5, :height)


#se definen 3 macheos cn require

#completo
# def fall_velocity(t = Tower.tower()) do
# fall_velocity(Tower.tower(t, :planemo), Tower.tower(t, :height))

#por partes
# def fall_velocity(Tower.tower(planemo: planemo, height: distance)) do

#por componentes individuales
# def fall_velocity(t = tower(planemo: planemo, height: distance)) do
# IO.puts("From #{tower(t, :name)}'s elevation" <>
# "of #{distance} meters on #{planemo},")


#los records se necesitan para la base de datos :O 
#al parecer viene integrada, no se si phoenix use esa misma, si es asi...:O!





