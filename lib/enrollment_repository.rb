require "csv"
class EnrollmentRepository

  attr_reader :enrollments

  def initialize
    @enrollments = []
  end

  def load_data(enrollment_data)
    # Get path to kindergarten file out of the data hash
    kindergarten_file = enrollment_data[:enrollment][:kindergarten]

    # Open the csv that the kindergarten file points to

    csv = CSV.open(kindergarten_file, headers: true, header_converters: :symbol)
    puts "GOT CSV: #{csv}"

    csv.group_by do |row|
      row[:location]
    end

    # CSV rows contain info for 1 District for
    # one year

    # Need to somehow group up all of the data for
    # each district
    # so that we can organize it by year

    # Need to use that info to make enrollment objects:

    # e = Enrollment.new({:name => "ACADEMY 20",
    #        :kindergarten_participation =>
    #              {2010 => 0.3915, 2011 => 0.35356, 2012 => 0.2677})
  end
end
