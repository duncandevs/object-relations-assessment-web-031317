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
