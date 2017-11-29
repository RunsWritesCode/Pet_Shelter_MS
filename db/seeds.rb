require_relative('../models/animal')
require_relative('../models/owner')
require("date")

animal1 = Animal.new({
  "name" => "Gaspode",
  "admission" => Date.new(2017, 1, 27),
  "adopted" => false,
  "trained" => true,
  "healthy" => true,
  "adoptable" => true,
  "species" => "dog",
  "breed" => "terrier",
  "profile_pic" => "Gaspode.jpg"
  })

animal2 = Animal.new({
  "name" => "Grebbo",
  "admission" => Date.new(2017, 2, 24),
  "adopted" => false,
  "trained" => false,
  "healthy" => true,
  "adoptable" => false,
  "species" => "cat",
  "breed" => "mixed",
  "profile_pic" => "Greebo.jpg"
  })

animal3 = Animal.new({
  "name" => "Wuffles",
  "admission" => Date.new(2017, 1, 27),
  "adopted" => false,
  "trained" => true,
  "healthy" => true,
  "adoptable" => true,
  "species" => "dog",
  "breed" => "small mixed breed"
  })

animal4 = Animal.new({
  "name" => "Dangerous Beans",
  "admission" => Date.new(2017, 1, 27),
  "adopted" => false,
  "trained" => true,
  "healthy" => true,
  "adoptable" => true,
  "species" => "rat",
  "breed" => "albino"
  })

animal5 = Animal.new({
  "name" => "Errol",
  "admission" => Date.new(2017, 1, 27),
  "adopted" => false,
  "trained" => true,
  "healthy" => true,
  "adoptable" => true,
  "species" => "dragon",
  "breed" => "draco lunaris",
  "profile_pic" => "Errol.jpg"
  })

animal1.save
animal2.save
animal3.save
animal4.save
animal5.save

owner1 = Owner.new({
  "first_name" => "Commander",
  "last_name" => "Vimes"
  })

owner2 = Owner.new({
  "first_name" => "Terry",
  "last_name" => "Pratchett"
  })

owner3 = Owner.new({
  "first_name" => "Sybil",
  "last_name" => "Ramkin"
  })

owner4 = Owner.new({
  "first_name" => "Granny",
  "last_name" => "Weatherwax"
  })

owner1.save
owner2.save
owner3.save
owner4.save
