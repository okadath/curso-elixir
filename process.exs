
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
    def report(count) do
        receive do
            msg -> IO.puts("Received #{count}: #{msg}")
            #si hay recursion de preferencia que sea tail recursive
            report(count + 1)
            #after (?) para terminar bajo condiciones
        end
    end
    
    def report2(count) do
        new_count = receive do
            msg -> IO.puts("Received #{count}: #{msg}")
            count + 1#aqui se iguala new count a count+1
        end
        report2(new_count)
    end
    
end

pid2 = spawn(Bounce, :report, [1])
send(pid2, 23)
send(pid2, :message)

pid3 = spawn(Bounce, :report2, [4])
send(pid3, 2124)
send(pid3, :asd)

pid1 = spawn(Bounce, :report, [1])
#registra un proceso
Process.register(pid1, :bounce)
send(:bounce, "Really?")


get_bounce = Process.whereis(:bounce)
Process.registered
#existe pero sin registro
Process.unregister(:bounce)
#checamos si ya no esta
test_bounce = Process.whereis(:bounce)
#aun existe como variable global pero sin registro
#ya no se puede acceder por atomo
#hay que reregistrar
send(get_bounce, "Still there?")



