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
end
