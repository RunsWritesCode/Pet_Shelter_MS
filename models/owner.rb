require_relative('../db/sql_runner')

class Owner

  attr_accessor :id, :first_name, :last_name, :address

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @first_name = options["first_name"]
    @last_name = options["last_name"]
    @address = options["address"]
  end

  def save()
    sql = "INSERT INTO owners
    (first_name,
    last_name, address)
    VALUES
      ( $1, $2, $3 )
      RETURNING *"
      values = [@first_name, @last_name, @address]
      owner = SqlRunner.run(sql, values)
      @id = owner.first()['id'].to_i
  end

  def pretty_name()
    return "#{@first_name} #{@last_name}"
  end

  def update()
  sql = "UPDATE owners
  SET
  (first_name,
  last_name,
  address) =
  (
    $1, $2, $3
  )
  WHERE id = $4"
  values = [@first_name, @last_name, @address, @id]
  SqlRunner.run( sql, values )
end

def self.all()
  sql = "SELECT * FROM owners"
  values = []
  owners = SqlRunner.run( sql, values )
  result = owners.map { |owner| Owner.new( owner ) }
  return result
end

def self.find( id )
  sql = "SELECT * FROM owners
  WHERE id = $1"
  values = [id]
  owner = SqlRunner.run( sql, values )
  result = Owner.new( owner.first )
  return result
end

def animals
  sql = "SELECT animals.*
  FROM animals
  WHERE $1 = animals.owner_id"
  values = [@id]
  animals = SqlRunner.run( sql, values )
  result = animals.map { |animal| Animal.new(animal) }
end

def delete()
  sql = "DELETE FROM owners
  WHERE id = $1"
  values = [@id]
  SqlRunner.run( sql, values )
end

end
