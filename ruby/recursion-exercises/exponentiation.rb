# Write two versions of exponent that use two different recursions

def exp1(b, n)
  return 1 if n == 0
  b * exp1(b, n - 1)
end

def exp2(b, n)
  return 1 if n == 0
  return b if n == 1
  if n % 2 == 0
    exp2(b * b, n / 2)
  else
    b * (exp2(b * b, (n - 1) / 2))
  end
end