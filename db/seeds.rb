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
  "name" => "Greebo",
  "admission" => Date.new(2017, 2, 24),
  "adopted" => false,
  "trained" => false,
  "healthy" => true,
  "adoptable" => false,
  "species" => "cat",
  "breed" => "mixed breed",
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
  "breed" => "small mixed breed",
  "profile_pic" => "wuffles.jpg"

  })

animal4 = Animal.new({
  "name" => "Dangerous Beans",
  "admission" => Date.new(2017, 1, 27),
  "adopted" => false,
  "trained" => true,
  "healthy" => true,
  "adoptable" => true,
  "species" => "rat",
  "breed" => "albino",
  "profile_pic" => "Dangerous Beans.jpg"
  })

animal5 = Animal.new({
  "name" => "Errol",
  "admission" => Date.new(2017, 1, 27),
  "adopted" => false,
  "trained" => true,
  "healthy" => true,
  "adoptable" => true,
  "species" => "dragon",
  "breed" => "swamp",
  "profile_pic" => "Errol.jpg"
  })

animal6 = Animal.new({
  "name" => "Binky",
  "admission" => Date.new(2017, 1, 27),
  "adopted" => false,
  "trained" => true,
  "healthy" => true,
  "adoptable" => true,
  "species" => "horse",
  "breed" => "flying",
  "profile_pic" => "binky.png"
  })

animal7 = Animal.new({
  "name" => "Rob Anybody",
  "admission" => Date.new(2017, 1, 27),
  "adopted" => false,
  "trained" => false,
  "healthy" => true,
  "adoptable" => false,
  "species" => "pictsie",
  "breed" => "Feegle",
  "profile_pic" => "Rob Anybody.jpg"
  })

animal8 = Animal.new({
  "name" => "The Librarian",
  "admission" => Date.new(2017, 3, 27),
  "adopted" => false,
  "trained" => false,
  "healthy" => true,
  "adoptable" => false,
  "species" => "orangutan",
  "breed" => "librarian",
  "profile_pic" => "Librarian.jpg"
  })

animal1.save
animal2.save
animal3.save
animal4.save
animal5.save
animal6.save
animal7.save
animal8.save

owner1 = Owner.new({
  "first_name" => "Commander",
  "last_name" => "Vimes",
  "address" => "Ramkin Residence, Ankh-Morpork"
  })

owner2 = Owner.new({
  "first_name" => "Terry",
  "last_name" => "Pratchett",
  "address" => "You'll need to ask Binky!"
  })

owner3 = Owner.new({
  "first_name" => "Sybil",
  "last_name" => "Ramkin",
  "address" => "Ramkin Residence, Ankh-Morpork"
  })

owner4 = Owner.new({
  "first_name" => "Granny",
  "last_name" => "Weatherwax",
  "address" => "Granny's House, Lancre, Ramtops"
  })

owner1.save
owner2.save
owner3.save
owner4.save
