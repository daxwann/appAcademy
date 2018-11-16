def measure(n = 1, &code)
  starting = Time.now.round(1)
  n.times &code
  ending = Time.now.round(1)
  return (ending - starting) / n
end
