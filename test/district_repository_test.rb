require 'minitest/autorun'
require 'minitest/pride'
require '../lib/district_repository'
require 'pry'

class DistrictRepositoryTest < Minitest::Test

  def test_hash_to_instance
    dr = DistrictRepository.new
    dr.hash_to_instance([{:location => "ACADEMY 20"}])
    assert_equal "ACADEMY 20", dr.districts[0].name
  end

  def test_load_data
    dr = DistrictRepository.new
    dr.load_data('Kindergartners in full-day program.csv')
    dr.districts
    assert_equal 1991, dr.districts.count
  end

  def test_hash_to_instance_can_pull_in_array_of_hashes
    dr = DistrictRepository.new
    dr.load_data('Kindergartners in full-day program.csv')
    assert_equal "COLORADO", dr.districts[0].name
    assert_equal "ACADEMY 20", dr.districts[15].name
  end

  def test_find_by_name
    skip
    dr = DistrictRepository.new
    dr.load_data('Kindergartners in full-day program.csv')
    assert_equal "ACADEMY 20", dr.find_by_name("ACADEMY 20")
  end

  def test_find_all_matching
    
    dr = DistrictRepository.new
    dr.load_data('Kindergartners in full-day program.csv')
    assert_equal [], dr.find_all_matching("%")
    assert_equal "ACADEMY 20", dr.find_all_matching("ACA")
  end

end
