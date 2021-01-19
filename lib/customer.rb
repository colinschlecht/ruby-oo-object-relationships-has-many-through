class Customer
  attr_accessor :name, :age

  @@all = []

  def initialize(name, age)
    @name = name
    @age = age
    @@all <<self
  end

  def self.all
    @@all
  end

  #no need to enter customer, just reference self

  def new_meal(waiter, total, tip=0)
    Meal.new(waiter, self, total, tip)
  end
#the customer can look back on every meal they've had with the meals method.
#now we can iterate through every meal, and return the ones the customer
#of this instance ate.

  def meals
    Meal.all.select do |meal|
      meal.customer == self
    end
  end

  #here we can get every waiter they've ever been served by.

  def waiters
    meals.map do |meal|
      meal.waiter
    end
  end

  

end