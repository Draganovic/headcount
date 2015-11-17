require 'minitest/autorun'
require 'minitest/pride'
require './lib/enrollment_repository'
require './lib/enrollment'

require 'pry'

class EnrollmentTest <Minitest::Test

  def test_enrollment_class_exists
    assert Enrollment.new({:name => "ACADEMY 20", :kindergarten_participation => {2010 => 0.3915, 2011 => 0.35356, 2012 => 0.2677}})
  end

  def test_enrollment_returns_formatted_data
    e = Enrollment.new({:name => "ACADEMY 20", :kindergarten_participation => {2010 => 0.3915, 2011 => 0.35356, 2012 => 0.2677}})
    assert "ACADEMY 20", e.name
    expected = {2010 => 0.3915, 2011 => 0.35356, 2012 => 0.2677}
    assert_equal expected, e.enrollment
  end


  def test_kindergarten_participation_by_year
   e = Enrollment.new({:name => "ACADEMY 20", :kindergarten_participation => {2010 => 0.3915, 2011 => 0.35356, 2012 => 0.2677}})


    expected = {2010 => 0.3915, 2011 => 0.35356, 2012 => 0.2677}
    assert_equal expected ,e.kindergarten_participation_by_year
    # assert_equal { 2010 => 0.391, 2011 => 0.353, 2012 => 0.267,}, enrollment.kindergarten_participation_by_year
  end

  def test_kindergarten_participation_in_year
    e = Enrollment.new({:name => "ACADEMY 20", :kindergarten_participation => {2010 => 0.3915, 2011 => 0.35356, 2012 => 0.2677}})

    assert_equal 0.3915, e.kindergarten_participation_in_year(2010)
  end

end
