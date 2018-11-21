

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
:dbg.tracer()
pid1 = spawn(MphDrop, :mph_drop, [])
:dbg.p(pid1, :m)
send(pid1, {:moon, 20})


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

#Analisis estatico ===================
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







