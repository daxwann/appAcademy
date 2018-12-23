#Let's write a method that will solve Gamma Function recursively. The Gamma
#Function is defined Γ(n) = (n-1)!.

def gamma_fnc(num)
  return nil if num < 1
  return 1 if num == 1
  return (num - 1) * gamma_fnc(num - 1)
end
