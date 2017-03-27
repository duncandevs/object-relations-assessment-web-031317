# Please copy/paste all three classes into this file to submit your solution!
class Customer
  attr_accessor :first_name, :last_name

  ALL = []
  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name  = last_name
    ALL << self
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def self.all
    ALL
  end

  def self.find_by_name(name)
    #iterate over the all array and return the following match
    #customer.name full_name
    self.all.find{|customer| customer.full_name  == name}
  end

  def self.find_all_by_first_name(first_name)
    #selecting only those customers with first name matching *name* returns an array
    self.all.select{|customer| customer.first_name == first_name}
  end

  def self.all_names
    #collects the full names of customers in an array
    self.all.collect{|customer| customer.full_name}
  end

  def add_review(restaurant,content)
    review = Review.new(self,restaurant,content)
  end
end

# Build out the following methods on the Review class
# Review.all
# returns all of the reviews
# Review#customer
# returns the customer for that given review
# Review#restaurant
# returns the restaurant for that given review
#Review.new(customer,restaurant,content)
class Review
  attr_accessor :restaurant , :customer , :content
  ALL = []
  def initialize(customer,restaurant,content)
    @customer = customer
    @restaurant = restaurant
    @content = content
    ALL << self
  end

  def self.all
    ALL
  end
end

# Build out the following methods on the restaurant class
# Restaurant.all
# returns an array of all restaurants
# Restaurant.find_by_name(name)
# given a string of restaurant name, returns the first restaurant that matches
# Restaurant#reviews
# returns an array of all reviews for that restaurant
# Restaurant#customers
# should return all of the customers who have written reviews of that restaurant.
class Restaurant
  attr_accessor :name
  ALL = []
  def initialize(name)
    @name = name
    ALL << self
  end

  def self.all
    ALL
  end

  def self.find_by_name(name)
    self.all.find{|restaurant| restaurant.name  == name}
  end

  def reviews
    #returns an array of all reviews for that restaurant
    #collect all of the reviews that match review.restaurant
    Review.all.select do |review|
      review.restaurant == self
    end

  end

  def customers
    self.reviews.collect{ |review| review.customer }
  end
end

#test with
# duncan = Customer.new("duncan","maina")
# cafe = Restaurant.new("cafe benne")
# duncan.add_review(cafe,"good coffee")
