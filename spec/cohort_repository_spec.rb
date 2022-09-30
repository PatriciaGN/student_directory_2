require_relative "../lib/cohort_repository.rb"

RSpec.describe CohortRepository do
    describe "#find" do
        it "finds a cohort with related students" do
            repo = CohortRepository.new
            cohort = repo.find_with_students(1)

            expect(cohort.name).to eq("September 22")
            expect(cohort.students.length).to eq 2
        end
    end
end