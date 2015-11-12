require 'minitest/autorun'
require 'minitest/pride'
require './lib/enrollment_repository'
require 'pry'

class EnrollmentRepositoryTest < Minitest::Test
  # er = EnrollmentRepository.new
  # er.load_data({
  #   :enrollment => {
  #     :kindergarten => "./data/Kindergartners in full-day program.csv"
  #   }
  # })
  # enrollment = er.find_by_name("ACADEMY 20")



  def test_enrollment_repository_exists
    er = EnrollmentRepository.new
    assert er
  end

  def test_enrollment_repository_loads_data
    er = EnrollmentRepository.new
    result = er.load_data({
      :enrollment => {
        :kindergarten => "./data/Kindergartners in full-day program.csv"
      }
    })
    puts result
    assert er.enrollments.count > 0
  end

end
