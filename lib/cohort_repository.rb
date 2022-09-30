require "cohort.rb"
require "student"

class CohortRepository
  def find_with_students(id)
    sql = "SELECT cohorts.id,
                  cohorts.name,
                  cohorts.starting_date,
                  students.id AS student_id,
                  students.name,
            FROM cohorts
            JOIN students ON students.cohort_id = cohort.id
            WHERE cohort.id = $1;"
    sql_params = [id]
    result = DatabaseConnection.exec_params(sql, sql_params)

    cohort = Cohort.new
    cohort.id = result.first['id']
    cohort.name = result.first['name']
    
    
    result.each do |record|
        student = student.new
        student.id = record['cohort_id']
        student.title = record['title']
        student.starting_date = record['starting_date']

        cohort.students << student
    end
    return cohort
  end
end