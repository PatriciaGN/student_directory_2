require "cohort.rb"
require "student"
require "database_connection"

class CohortRepository
  def find_with_students(id)
    sql = 'SELECT cohorts.id,
              cohorts.title,
              cohorts.starting_date,
              students.id AS student_id,
              students.name
           FROM cohorts
           JOIN students ON students.cohort_id = cohorts.id
           WHERE cohorts.id = $1;'

  

    sql_params = [id]
    result = DatabaseConnection.exec_params(sql, sql_params)

    cohort = Cohort.new
    cohort.id = result.first['id']
    cohort.title = result.first['title']
    cohort.starting_date = result.first['starting_date']
    
    
    result.each do |record|
        student = Student.new
        student.id = record['cohort_id']
        student.name = record['name']
        
        cohort.students << student
    end
    return cohort
  end
end