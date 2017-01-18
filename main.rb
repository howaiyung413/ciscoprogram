#C:\Ruby22-x64\bin -w



def input_check(hashname, objecthash, object)

  object_string = object.to_s
  #puts object_string

  #if (object.is_a? Integer)

  #puts object_temp

  #if !(object_temp =~ /^[0-9A-F]+$/i)
  #puts object_string

  if (object.is_a? Integer) && !(object_string =~ /^[0-9][A-F]+$/i) && !(object.is_a? Float)
    temp_num = Integer(object).to_i rescue nil
  else
    raise ArgumentError.new("Improper input for " + hashname + ", attribute "+ objecthash)
  end

  if temp_num == nil || temp_num<0
    raise ArgumentError.new("Improper input for " + hashname + ", attribute "+ objecthash)
  end
  return temp_num


end

class Meal_order
  attr_accessor :total_meals, :vegetarian, :gluten_free, :nut_free, :fish_free



  def self.get_info(first_msg, error_msg)
    temp_num = 0

    print first_msg
    temp_num = Integer(gets).to_i rescue nil

    until temp_num != nil and temp_num >= 0
      print error_msg
      temp_num = Integer(gets) rescue nil
    end

    return temp_num
  end

  def self.new_using_order_meals()
    t_c=0
    veg=0
    g_f=0
    n_f=0
    f_f=0

    begin

      t_c = get_info("How many meals are we ordering for the team?: ", "Invalid input, please retype the number of meals been ordered: ")
      veg = get_info("How many meals of those meals are vegetarian?: ", "Invalid input, please retype the number of vegetarian meals been ordered: ")
      g_f = get_info("How many meals of those meals are gluten free?: ", "Invalid input, please retype the number of gluten free meals been ordered: ")
      n_f = get_info("How many meals of those meals are nut free?: ", "Invalid input, please retype the number of nut free meals been ordered: ")
      f_f = get_info("How many meals of those meals are fish free?: ", "Invalid input, please retype the number of fish free meals been ordered: ")


      puts "The total amount of meals is less than the amount of specialized meals been ordered. Please retype your order again." if (t_c<(veg+g_f+n_f+f_f))

    end until ((veg+g_f+n_f+f_f) <= t_c)

    self.new(t_c, veg, g_f, n_f, f_f)

  end



  def initialize(t_c, veg, g_f, n_f, f_f)

      input_check("Order meal", "Total_meals", t_c)
      input_check("Order meal", "vegetarian", veg)
      input_check("Order meal", "gluten_free", g_f)
      input_check("Order meal", "nut_free", n_f)
      input_check("Order meal", "fish_free", f_f)

      raise ArgumentError.new("The total amount of meals is less than the amount of specialized meals been ordered. Please retype your order again.") if (t_c<(veg+g_f+n_f+f_f))


      @total_meals = t_c
      @vegetarian = veg
      @gluten_free = g_f
      @nut_free = n_f
      @fish_free = f_f

  end
end

class Restaurant < Meal_order
  attr_accessor :rest_name, :rest_rating




  def initialize(name, rating, t_c, veg, g_f, n_f, f_f)

    input_check(name, "Total_meals", t_c)
    input_check(name, "vegetarian", veg)
    input_check(name, "gluten_free", g_f)
    input_check(name, "nut_free", n_f)
    input_check(name, "fish_free", f_f)

    super(t_c, veg, g_f, n_f, f_f)
    @rest_name=name
    @rest_rating=rating
  end

end


class Restaurants

  attr_accessor :rests

  def initialize
    @rests = Array.new
  end

  def sort_by(sort_type)

    for rest in @rests

      #puts rest.meals_served.key?(:vegetarian)
      #puts rest.meals_served.key?(sort_type)
      #puts rest.key?(sort_type)
    end

  end


# Delete restaurants that don't have specific meals that is required from the


end












class Main

  #puts "Welcome to my restaurant customizer"

  #order_team = Meal_order.new_using_order_meals

  restaurants = Restaurants.new

  #restaurants.rests.push(Restaurant.new("Phillips",5,2.5,0.1,0.1,0.1,0.1))

  #restaurants.rests.push(Restaurant.new("Phillips",5,nil,nil,nil,nil,nil))

  restaurants.rests.push(Restaurant.new("Phillips",5,0x90,0x26,0x10,0x10,0x10))





  #restaurants = Restaurants.new

  #restaurants.rests.push(Restaurant.new("Phillips",5,{total_meals: 40, vegetarian: 5, gluten_free: 2, nut_free: 2, fish_free: 2}))
  #restaurants.rests.push(Restaurant.new("Chicken LaFlay",4,{total_meals: 20, gluten_free: 1, nut_free: 1, fish_free: 1}))


  #restaurants.sort_by(:vegetarian)

  #restaurants.sort_by(:vegetarian)

  #Error checking if the total number of gluten, nut, vegetarian, fish > Total meals



  #puts order_team.t_c


  # Algorithm, find which sub group is the biggest from the order
  # Select the 1st restaurant base upon the closest amount that can handle the number of meals
  #
  # Generate a bunch of restaurants using a random name and number generator function
  # about a 100 restaurants

  # Another function handles the selection

  # display results

end







Main
