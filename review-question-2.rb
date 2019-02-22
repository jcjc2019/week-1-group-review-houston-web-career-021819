# Finish the implementation of the Car class so it has the functionality described below

class Car

  @@all = []
  attr_accessor :make, :model
  def initialize(make, model)
    @make = make
    @model = model
    @@all << self
  end

  def drive
    "VROOOOOOOOOOOOM!"
  end

  def self.all
    @@all
  end

end

car = Car.new("anymake", "anymodel")

#Below: source code copied from the question
volvo_lightning = Car.new("Volvo", "Lightning")
yugo = Car.new("Zastava", "Yugo")
lada = Car.new("AvtoVAZ", "Lada")

volvo_lightning.make
#=> "Volvo"
volvo_lightning.model
#=> "Lightning"

car.drive
# => "VROOOOOOOOOOOOM!"

Car.all
#=> [#<Car:0x00007fae28930f20>, #<Car:0x00007fae28923370>, #<Car:0x00007fae2891ae78>]

BONUS:

#in order to make the line below work, we have to change the previous class code into the following code:

class Car
  
  attr_accessor :make, :model
  #to initialize an empty hash, with 2 key-value pairs
  def initialize(params ={})
    @make = params.fetch(:make, make)
    @model = params.fetch(:model, model)
  end

  def to_s #change the key-value pair to string
    "#{make} #{model}"
  end

end

volvo_lightning = Car.new(make: "Volvo", model: "Lightning")

volvo_lightning.make
#=> "Volvo"
volvo_lightning.model
#=> "Lightning"
