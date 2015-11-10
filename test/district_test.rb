require 'minitest/autorun'
require 'minitest/pride'
require '../lib/district'

class DistrictTest<Minitest::Test

  def test_district_class_exist
    assert District.new({:name => "ACADEMY 20"})
  end

  def test_district_passes_name
    d = District.new({:name => "ACADEMY 20"})
    assert "ACADEMY 20", d.name
  end

end
