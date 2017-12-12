require_relative('../db/sql_runner')

class Animal

  attr_accessor :name, :admission, :adopted, :trained, :healthy, :adoptable, :species, :breed, :owner_id
  attr_reader :profile_pic, :id

def initialize(options)
  @id = options['id'].to_i if options['id']
  @name = options["name"]
  @admission = options["admission"]
  @adopted = options["adopted"]
  @trained = options["trained"]
  @healthy = options["healthy"]
  @adoptable = options["adoptable"]
  @species = options["species"]
  @breed = options["breed"]
  @owner_id = options["owner_id"].to_i if options["owner_id"]
  @profile_pic = options["profile_pic"]
end

  def save()
    sql = "INSERT INTO animals
    ( name,
    admission,
    adopted,
    trained,
    healthy,
    adoptable,
    species,
    breed,
    profile_pic)
    VALUES
    (
      $1,
      $2,
      $3,
      $4,
      $5,
      $6,
      $7,
      $8,
      $9)
      RETURNING *"
      values = [@name, @admission, @adopted, @trained, @healthy, @adoptable, @species, @breed, @profile_pic]
      pet = SqlRunner.run(sql, values)
      @id = pet.first()['id'].to_i
  end


  def update()
    sql = "UPDATE animals
    SET
    ( name,
    admission,
    adopted,
    trained,
    healthy,
    adoptable,
    species,
    breed,
    owner_id) =
    (
      $1, $2, $3, $4, $5, $6, $7, $8, $9
    )
    WHERE id = $10"
    values = [@name, @admission, @adopted, @trained, @healthy, @adoptable, @species, @breed, @owner_id, @id]
    SqlRunner.run( sql, values )
  end

  def delete()
    sql = "DELETE FROM animals
    WHERE id = $1"
    values = [@id]
    SqlRunner.run( sql, values )
  end

  def self.all()
    sql = "SELECT * FROM animals"
    values = []
    animals = SqlRunner.run( sql, values )
    result = animals.map { |animal| Animal.new( animal ) }
    return result
  end

  def self.find( id )
    sql = "SELECT * FROM animals
    WHERE id = $1"
    values = [id]
    animal = SqlRunner.run( sql, values )
    result = Animal.new( animal.first )
    return result
  end

  def self.all_adoptable( )
    sql = "SELECT * FROM animals
    WHERE adoptable = TRUE and adopted = FALSE"
    values = []
    animals = SqlRunner.run( sql, values )
    result = animals.map { |animal| Animal.new( animal ) }
    return result
  end

  def self.all_not_adoptable( )
    sql = "SELECT * FROM animals
    WHERE adoptable = FALSE"
    values = []
    animals = SqlRunner.run( sql, values )
    result = animals.map { |animal| Animal.new( animal ) }
    return result
  end

  def owner
    sql = "SELECT * FROM owners
    WHERE id = $1"
    values = [@owner_id]
    owner = SqlRunner.run( sql, values )
    result = Owner.new( owner.first )
    return result
  end

  def adopt(owner_id)
    @owner_id = owner_id
    @adopted = TRUE
  end

  def health_check
    if @healthy == "t"
       "healthy!"
    else
       "undergoing treatment"
    end
  end

  def training_check
    if @trained == 't'
       "I'm a good #{@species}"
    else
       "I need some work"
    end
  end

end
