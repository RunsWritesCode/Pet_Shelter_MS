require_relative('../db/sql_runner')

class Animal

  attr_accessor :id, :name, :admission, :adopted, :trained, :healthy, :adoptable

def initialize(options)
  @id = options['id'].to_i if options['id']
  @name = options["name"]
  @admission = options["admission"]
  @adopted = options["adopted"]
  @trained = options["trained"]
  @healthy = options["healthy"]
  @adoptable = options["adoptable"]
end

  def save()
    sql = "INSERT INTO animals
    ( name,
    admission,
    adopted,
    trained,
    healthy,
    adoptable)
    VALUES
    (
      $1,
      $2,
      $3,
      $4,
      $5,
      $6)
      RETURNING *"
      values = [@name, @admission, @adopted, @trained, @healthy, @adoptable]
      pet = SqlRunner.run(sql, values)
      @id = pet.first()['id'].to_i
  end


  def update()
    sql = "UPDATE animals
    SET
    (
      first_name,
      last_name,
      topping_id,
      quantity
    ) =
    (
      $1, $2, $3, $4
    )
    WHERE id = $5"
    values = [@first_name, @last_name, @topping_id, @quantity, @id]
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

  def owner
    sql = "SELECT * FROM owners
    WHERE id = $1"
    values = [@owner_id]
    owner = SqlRunner.run( sql, values )
    result = Owner.new( owner.first )
    return result
  end
  
end
