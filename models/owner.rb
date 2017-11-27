require_relative('../db/sql_runner')

class Owner

  attr_accessor :id, :first_name, :last_name

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @first_name = options["first_name"]
    @last_name = options["last_name"]
  end

  def save()
    sql = "INSERT INTO owners
    (first_name,
    last_name)
    VALUES
      (
        $1,
        $2)
        RETURNING *"
        values = [@first_name, @last_name]
        owner = SqlRunner.run(sql, values)
        @id = owner.first()['id'].to_i
  end

  def pretty_name()
    return "#{@first_name} #{@last_name}"
  end

  def update()
  sql = "UPDATE owners
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

end
