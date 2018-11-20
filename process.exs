
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
    @doc """
    us un contador incremental para paso de mensajes
    """
    def report2(count) do
        new_count = receive do
            msg -> IO.puts("Received #{count}: #{msg}")
            count + 1#aqui se iguala new count a count+1
        end
        report2(new_count)
    end
    @doc """
    simulamos un error al dividir  entre dos , 
    le pasaremos un atomo
    """
    def report_error do
        receive do
            x -> IO.puts("Divided to #{x / 2}")
            report_error()
        end
    end
    
end

#spawn regresa el PID, los argumentos a los metodos van
#entre corchetes, lo "carga", listo para inciar a trabajar
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
#hay que re-registrar
send(get_bounce, "Still there?")

#obtenemos el pid al enlazarlo con el modulo bounce
#con el metodo report_error y pasandole una lista nula
pid4 = spawn(Bounce, :report_error, [])
Process.register(pid4, :Test_error)
#al ser en un proceso este se muere pero los dmas existen
IO.inspect Process.registered
send(pid4, 7)
send(pid4, :seven)
#a partir del error anterior truena pero aun esta en lista 
#ya no funciona pero sigue enlistado y otros si funcionan
send(pid4, 14)
send(pid3, 123)
IO.inspect Process.registered

#==================================================
defmodule Drop do

    def drop do
        receive do
            #recibiendo el mensaje, sabe quien se lo pidio y a el
            #le envia la informacion ya tratada
            {from, planemo, distance} ->
            IO.puts "Drop.drop:envio plandemo, distancia y velocidad"
            send(from, {planemo, distance, fall_velocity(planemo, distance)})
            drop()
        end
    end

    defp fall_velocity(:earth, distance) when distance >= 0 do
        :math.sqrt(2 * 9.8 * distance)
    end
    
    defp fall_velocity(:moon, distance) when distance >= 0 do
        :math.sqrt(2 * 1.6 * distance)
    end

    defp fall_velocity(:mars, distance) when distance >= 0 do
        :math.sqrt(2 * 3.71 * distance)
    end
end

defmodule MphDrop do
    def mph_drop do
        IO.puts " Mph_drop.mph_drop:almaceno el PID de drop y lo envio a MphDrop.convert"
        #obtiene la direccion del proceso con el que trabajara
        drop_pid = spawn(Drop, :drop, [])
        convert(drop_pid)
    end

    def convert(drop_pid) do
        receive do
        {planemo, distance} ->
            #aqui lo separamos para no andar agregando 
            #procesos a lo idiota con el send
            #se identifica pasando su direccion propia al otro proceso
            IO.puts "Convert/2;recibi 2 valores, envio 3 a drop_pid, que enlaza a :drop, le mando mi PID, plan y dist"
            send(drop_pid, {self(), planemo, distance})
            convert(drop_pid)
        {planemo, distance, velocity} ->
            IO.puts "Convert/3:recibi 3 valores"
            mph_velocity = 2.23693629 * velocity
            IO.write("On #{planemo}, a fall of #{distance} meters ")
            IO.puts("yields a velocity of #{mph_velocity} mph.")
            convert(drop_pid)
        end
    end

end

IO.puts "agrego a :mph_drop para iniciar todo"
pid1 = spawn(MphDrop, :mph_drop, [])
IO.puts "despues mando manualmente un mensaje a mph_drop con 2 datos"
send(pid1, {:earth, 20})




