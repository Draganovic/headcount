class Enrollment

  attr_reader :name
  attr_reader :enrollment

  def initialize(enrollment_data)
    @name = enrollment_data[:name].upcase
    @enrollment= enrollment_data[:kindergarten_participation]
  end

  def kindergarten_participation_by_year
    enrollment
  end

  def kindergarten_participation_in_year(year)
    kindergarten_participation_by_year[year]
  end

end
