require 'minitest/autorun'
require 'minitest/pride'
require '../lib/district_repository'
require 'pry'

class DistrictRepositoryTest < Minitest::Test

  def test_hash_to_instance
    dr = DistrictRepository.new
    dr.hash_to_instance([{:name => "ACADEMY 20"}])
    assert_equal "ACADEMY 20", dr.district[0].name
  end

  def test_hash_to_instance_can_pull_in_array_of_hashes
    dr = DistrictRepository.new
    dr.hash_to_instance([{:name => "ACADEMY 20"}, {:name => "DOUGLAS COUNTY"}])
    assert_equal "ACADEMY 20", dr.district[0].name
    assert_equal "DOUGLAS COUNTY", dr.district[1].name
  end

  def test_find_all_matching
  
  end

end
