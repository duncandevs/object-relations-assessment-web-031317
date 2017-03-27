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
