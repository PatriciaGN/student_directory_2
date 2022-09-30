require "student"

class Cohort 
    attr_accessor :id, :title, :starting_date, :students

    def initialize
        @students = []
    end
end