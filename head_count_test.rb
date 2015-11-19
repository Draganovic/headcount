require './district_repository'

class HeadCountAnalysisTest <Minitest::Test

  def test_head_count_analysis_initializes

    assert HeadcountAnalyst.new(dr)
  end

end
