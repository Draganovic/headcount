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
    dr.hash_to_instance([{:location => "ACADEMY 20"}, {:location => "DOUGLAS COUNTY"}])
    assert_equal "ACADEMY 20", dr.districts[0].name
    assert_equal "DOUGLAS COUNTY", dr.districts[1].name
  end

  def test_find_by_name
    dr = DistrictRepository.new
    dr.

    assert_equal
  end

end
