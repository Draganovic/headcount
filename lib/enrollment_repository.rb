class EnrollmentRepository

  def find_by_name(name)
    districts.find { |district| district.name == name.upcase }
  end
