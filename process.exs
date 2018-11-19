
#================================
#Process, al aprecer no compila desde un archivo, a saber
IO.inspect self()
IO.inspect send(self(), :test1)
#flush()
receive do
    x -> x
    IO.inspect(x)
end

#receive do
# y -> 2 * y
#end
#en un modulo 

defmodule Bounce do
#este metodo sera llamado
    def report do
        receive do
            msg -> IO.puts("Received #{msg}")
            #lamada recursiva para que se repita el loop
            report()
        end
    end
end