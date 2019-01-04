class Calculator
  def sum(a, b)
    a + b
  end

  def multiply(a, b)
    a * b
  end

  def factorial(a)
    (1..a).inject(:*)
  end

  def sqrt(a)
    Math.sqrt(a)
  end
end
