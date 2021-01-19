class Waiter
    
    attr_accessor :name, :yrs_experience

    @@all = []

    def initialize(name, yrs_experience)
        @@all << self
        @name = name
        @yrs_experience = yrs_experience
    end

    def self.all
        @@all
    end

   #we dont need to take the waiter as an arguement becasue that will
   #be passed on as a refrence through self

    def new_meal(customer, total, tip=0)
        Meal.new(self, customer, total, tip)
    end

    #to get all the meals they have served, create a meals method

    def meals
        Meal.all.select do |meal|
            meal.waiter == self
        end
    end

    #To find the best tipper, we can write another method, 
    #best_tipper, use the array we get from #meals, then 
    #return the customer of the meal with the highest tip:

    def best_tipper
        best_tipped_meal = meals.max do |meal_a, meal_b|
          meal_a.tip <=> meal_b.tip
        end
      
        best_tipped_meal.customer
      end

    #   customers have access to waiters and vice versa. 
    #   Neither the customer nor waiter needed additional attributes.
    #   THey only need methods that ask the right questions --
    #   in this case to the meal class, the join between the customer and waiter.

end
