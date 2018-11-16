defmodule Count do
#lo normal es no usar nunca ifs, casi siempre guards
    def countdown(from) when from > 0 do
        IO.inspect(from)
        countdown(from-1)
    end
    def countdown(from) do
        IO.puts("blastoff!")
    end
    
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