require_relative "./cohort"
require_relative "./student"

class CohortRepository
  def all
    sql = 'SELECT * FROM cohorts;'
    result_set = DatabaseConnection.exec_params(sql, [])
    cohorts = []
    result_set.each do |hash|
      cohort = Cohort.new
      cohort.id = hash["id"]
      cohort.name = hash["name"]
      cohort.starting_date = hash["starting_date"]
      cohorts << cohort
    end
    return cohorts
  end

  def find_cohort_students(id)

    sql = 'SELECT cohorts.id, cohorts.name AS cohort_name, cohorts.starting_date, students.id AS student_id, students.name, students.cohort_id
            FROM cohorts JOIN students ON cohort_id = cohorts.id
            WHERE cohorts.id = $1'
    
    result_set = DatabaseConnection.exec_params(sql, [id])
    cohort = Cohort.new
    cohort.id = result_set.first["id"]
    cohort.name = result_set.first["cohort_name"]
    cohort.starting_date = result_set.first["starting_date"]

    
    result_set.each do | record |
      student = Student.new
      student.id = record["student_id"]
      student.name = record["name"]
      student.cohort_id = record["cohort_id"]
      cohort.students << student
    end
    return cohort
  end


end