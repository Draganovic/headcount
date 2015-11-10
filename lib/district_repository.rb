require_relative 'district'

class DistrictRepository

  attr_reader :district

  def initialize
    @district = []
  end

  def hash_to_instance(hash_array)
    hash_array.each do |hash|
      @district << District.new(hash)
    end
  end

  def find_by_name(name)
         #each looked into  == name
  end
  #returns nil or instance of District



  def find_all_matching
    #returns [] or one/more matches (name fragment)
  end

  def load_data
    #skip
  end
end
