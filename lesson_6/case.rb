capacity = rand(100)

message = case capacity
          when 0
            "You ran out of gas"
          when 1..20
            "The tank is almost empty"
          when 21..70
            "You should be ok"
          when 71..100
            "The tank is almost full"
          else
            "Error: capacity has an invalid value (#{capacity})"
          end

puts message
