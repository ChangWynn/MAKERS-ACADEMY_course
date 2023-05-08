require_relative 'lib/database_connection'
require_relative 'lib/cohort_repository.rb'

DatabaseConnection.connect("student_directory_2")

jan2023 = CohortRepository.new

jan2023.all.each do |cohort|
  p cohort
end

jan2023_students = jan2023.find_cohort_students(1)

jan2023_students.students.each { |student| p student.name }