class Enrollment

  attr_reader :name

  def initialize(enrollment_data)
    @name = enrollment_data[:location].upcase
    @enrollment =
  end
end
