require_relative "../lib/cohort_repository.rb"

def reset_cohorts_table
    seed_sql = File.read('spec/seeds_cohortsstudents.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'student_directory_2' })
    connection.exec(seed_sql)
end

RSpec.describe CohortRepository do
    before(:each) do
        reset_cohorts_table
    end
      
    
    describe "#find" do
        it "finds a cohort with related students" do
            repo = CohortRepository.new
            cohort = repo.find_with_students(1)

            expect(cohort.title).to eq("September 22")
            expect(cohort.students.length).to eq 2
        end
    end
end