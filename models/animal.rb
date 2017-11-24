require_relative('../db/sql_runner')

class Animal

attr_reader :id, :name, :admission, :adopted, :trained, :healthy, :adoptable

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
    (name,
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

  def self.all
    sql = "SELECT * FROM animals"
    values = []
    animals = SqlRunner.run(sql, values)
    pets = animals.map { |animal | Animal.new( animal )}
    return pets
  end

end
