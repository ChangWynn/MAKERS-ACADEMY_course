require "cohort_repository"

describe CohortRepository do
  def reset_cohorts_table
    seed_sql = File.read('spec/seeds_cohorts.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'student_directory_test' })
    connection.exec(seed_sql)
  end
  before(:each) do 
    reset_cohorts_table
  end

  context "#all method" do
    it "should return a list of cohorts" do
      result = subject.all
      expect(result.length).to eq 2 
      expect(result.first.id).to eq '1'
      expect(result.first.name).to eq 'Jan 2023'
      expect(result.first.starting_date).to eq '2023-01-14'
    end
  end
  context "#find_cohort_students method" do
    it "should return a list of students given the cohort" do
      cohort = subject.find_cohort_students(1)

      expect(cohort.name).to eq "Jan 2023"
      expect(cohort.starting_date).to eq '2023-01-14'
      expect(cohort.students.length).to eq 3
      expect(cohort.students[1].name).to eq "James"
    end
  end

end