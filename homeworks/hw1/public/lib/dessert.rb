# Create a class Dessert with getters and setters for name and calories.
# The constructor should accept arguments for name and calories.
class Dessert
  @@MAX_CALORIES_HEALTHY=200
  attr_accessor :name,:calories
  # Define instance methods healthy?, which returns true if and only if a dessert has less than 200 calories,
  # and delicious?, which returns true for all desserts.
  def initialize(name, calories)
    @name=name
    @calories=calories
  end
  def healthy?
    @calories and @calories < @@MAX_CALORIES_HEALTHY
  end
  def delicious?
    true
  end
end

# Create a class JellyBean that inherits from Dessert.
# The constructor should accept a single argument giving the jelly bean's flavor;
# a newly-created jelly bean should have 5 calories and its name should be the
# flavor plus "jelly bean", for example, "strawberry jelly bean".
class JellyBean < Dessert
  attr_accessor :flavor
  def initialize(flavor)
    super(flavor+' jelly bean',5)
    @flavor=flavor
  end
  def delicious?
    @flavor=='licorice'?false:super
  end
end
