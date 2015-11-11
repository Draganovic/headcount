require_relative 'district'
require 'csv'

class DistrictRepository

  attr_reader :districts

  def initialize
    @districts = []
  end

  def hash_to_instance(hash_array)
    hash_array.each do |hash|
      @districts << District.new(hash)
    end
  end

  def find_by_name(name)
    districts.find { |district| district.name == name.upcase }
  end

  def find_all_matching
    districts.select { |district| district.name.match(/#{name.upcase}/)}
    #returns [] or one/more matches (name fragment)
  end

  def load_data(csv_file)
    file_path = File.join('../data/', csv_file)
    csv = CSV.open file_path, headers: true, header_converters: :symbol
    hash_array = csv.map(&:to_hash)
    hash_to_instance(hash_array)
  end
end
