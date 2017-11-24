require_relative('../models/animal')
require_relative('../models/owner')

animal1 = Animal.new({
  "name" => "Inspector Carrot",
  "admission" => "01.02.2017",
  "adopted" => false,
  "trained" => true,
  "healthy" => true,
  "adoptable" => true
  })

animal2 = Animal.new({
  "name" => "Nanny Ogg",
  "admission" => "01.03.2017",
  "adopted" => false,
  "trained" => false,
  "healthy" => true,
  "adoptable" => false
  })

animal1.save
animal2.save

owner1 = Owner.new({
  "first_name" => "Commander",
  "last_name" => "Vimes"
  })

owner2 = Owner.new({
  "first_name" => "Terry",
  "last_name" => "Pratchett"
  })

owner1.save
owner2.save
