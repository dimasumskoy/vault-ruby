hypotenuse  = sides[2]
second_side = sides[1]
third_side  = sides[0]

hypotenuse_check = hypotenuse ** 2 == second_side ** 2 + third_side ** 2

if hypotenuse == second_side && hypotenuse == third_side
  puts "Треугольник равносторонний"
elsif hypotenuse_check && second_side == third_side
  puts "Треугольник прямоугольный и равнобедренный"
elsif hypotenuse_check
  puts "Треугольник прямоугольный"
else
  puts "Треугольник не прямоугольный"
end
