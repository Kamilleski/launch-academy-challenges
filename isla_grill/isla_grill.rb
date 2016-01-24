dinner_total = gets.chomp
tip = [15, 18, 20, 25].sample
recommended_tip = (tip * 0.01) * dinner_total.to_f
puts "You should tip $#{recommended_tip}."
