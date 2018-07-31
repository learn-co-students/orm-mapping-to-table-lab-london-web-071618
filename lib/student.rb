class Student

  # Remember, you can access your database connection anywhere in this class
  #  with DB[:conn]
  attr_accessor :name, :grade
  attr_reader :id

  def initialize(id=nil, name, grade)
    @id = id
    @name = name
    @grade = grade


  end


  def self.create_table
    sql = <<-SQL
CREATE TABLE IF NOT EXISTS students(
  id INTEGER PRIMARY KEY,
   name TEXT,
    grade TEXT
  )
    SQL
    DB[:conn].execute(sql)
end

def self.drop_table
sql= "DROP TABLE IF EXISTS students"
DB[:conn].execute(sql)
end


#it initialise with a hash of atributes
def self.create(name:, grade:)
  student= Student.new(name, grade)
  student.save
  student
end

def save
  #db.execute("INSERT INTO students(name, grade) VALUES(?, ?)", name, grade)
if self.id
  self.update
else
    sql= <<-SQL
    INSERT INTO students (name, grade)
    VALUES (?, ?)
    SQL
    DB[:conn].execute(sql, self.name, self.grade)

    # DB[:conn].execute(sql, self.name, self.grade)
    # #Grabbing the ID of that newly inserted row and assigning the given
    # #Pokemon instance's id attribute equal to the ID of its associated database table row.
  @id = DB[:conn].execute("SELECT last_insert_rowid() FROM students")[0][0]
end 
    #db.execute("INSERT INTO pokemon(name, type) VALUES(?, ?)", name,type)
end



end
