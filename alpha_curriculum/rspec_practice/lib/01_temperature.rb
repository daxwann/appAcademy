#temperature conversion functions

#fahrenheit to celsius
def ftoc(degF)
  degC = (degF - 32.0) * 5.0 / 9.0
  return degC
end

#celsius to fahrenheit
def ctof(degC)
  degF = degC * 9.0 / 5.0 + 32
  return degF
end
