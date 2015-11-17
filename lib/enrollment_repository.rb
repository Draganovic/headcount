require "csv"
require_relative 'enrollment'
class EnrollmentRepository

  attr_reader :enrollments

  def initialize
    @enrollments = []
  end

  def load_data(enrollment_data)
    kindergarten_file = enrollment_data[:enrollment][:kindergarten]
    csv = CSV.open(kindergarten_file, headers: true, header_converters: :symbol)
    hash_array = csv.group_by do |row|
      row[:location]
    end

    hash_to_instance(organize_enrollment_data(hash_array))

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

  def hash_to_instance(hash_array)
    hash_array.each do |hash|
      @enrollments << Enrollment.new(hash)
    end
  end

  private

  def organize_enrollment_data(hash_array)
    hash_array.map do |location, rows|
      location_hash = {}
      location_hash[:name] = location
      location_hash[:kindergarten_participation] = rows.reduce({}) do |data_hash, row|
        data_hash[row[:timeframe]] = row[:data]
        data_hash
      end
      location_hash
    end
  end
end
