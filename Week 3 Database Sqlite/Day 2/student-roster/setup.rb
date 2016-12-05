require 'sqlite3'
require 'pp'

$db = SQLite3::Database.new "students.db"

module StudentDB
  def self.setup
    $db.execute(
      <<-SQL
        CREATE TABLE students (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          first_name VARCHAR(64) NOT NULL,
          last_name VARCHAR(64) NOT NULL,

          birthday DATE NOT NULL,
        
          created_at DATETIME NOT NULL,
          updated_at DATETIME NOT NULL
        );
      SQL
    )
  end

  def self.seed
    
    $db.execute(
      <<-SQL
        INSERT INTO students
          (first_name, last_name, birthday, created_at, updated_at)
        VALUES
          ('Brick','Thornton','1988-1-1', DATETIME('now'), DATETIME('now'));

                
      SQL
    )
  end
end

class Student
  def initialize
    @created_at = Time.now
    @updated_at = Time.now
  end

  def add_student(first_name,last_name,birthday)
    $db.execute(
      <<-SQL
        INSERT INTO students
        (first_name, last_name, birthday, created_at, updated_at)
        VALUES
        ("#{first_name}", "#{last_name}", "#{birthday}", DATETIME('now'), DATETIME('now'));

      SQL
    )
  end

  def delete_student(student_id)
    $db.execute(
      <<-SQL
        DELETE FROM students WHERE id = "#{student_id}";
    SQL
    )
  end

  def list_of_students
    $db.execute(
      <<-SQL
        SELECT * FROM students;
      SQL
    )
  end

  def first_name(first_name)
    $db.execute(
      <<-SQL
        SELECT * FROM students WHERE first_name = "#{first_name}";
      SQL
    )
  end

  def any_attribute(attribute, value)
    $db.execute(
      <<-SQL
        SELECT * FROM students WHERE "#{attribute}" = "#{value}";
      SQL
    )
  end

  def list_by_month
    $db.execute(
      <<-SQL
        SELECT first_name, last_name, birthday FROM students GROUP BY birthday ORDER BY birthday;
      SQL
    )
  end 
end

StudentDB.setup
StudentDB.seed

student = Student.new
student.add_student("Mayu", "Chan", "1990-6-5")
student.add_student("Sakura", "Chan", "1990-5-6")
student.delete_student("1")

p student.list_of_students
pp student.first_name("Mayu")
p student.any_attribute("last_name", "Chan")
pp student.list_by_month