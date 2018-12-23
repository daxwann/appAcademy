#Write a function ice_cream_shop(flavors, favorite) that takes in an array of
#ice cream flavors available at the ice cream shop, as well as the user's
#favorite ice cream flavor. Recursively find out whether or not the shop offers
#their favorite flavor.

def ice_cream_shop(flavors, favorite)
  return false if flavors.empty?
  return flavors.first == favorite if flavors.size == 1
  middle = flavors.size / 2
  return true if ice_cream_shop(flavors[0...middle], favorite)
  return true if ice_cream_shop(flavors[middle..-1], favorite)
  return false
end
