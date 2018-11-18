class Dog
  def initialize(name, breed, age, bark, favorite_foods)
    @name = name
    @breed = breed
    @age = age
    @bark = bark
    @favorite_foods = favorite_foods
  end

  def name
    @name
  end

  def breed
    @breed
  end

  def age
    @age
  end

  def age=(new_age)
    @age = new_age
  end

  def bark
    if self.age > 3
      "BORK!"
    else
      "bork!"
    end
  end

  def favorite_foods
    @favorite_foods
  end

  def favorite_food?(guess)
    if self.favorite_foods.map {|food| food.downcase}.include?(guess.downcase)
      return true
    else
      return false
    end
  end
end
