require 'test_helper'

class LabDatumTest < ActiveSupport::TestCase
  def setup
    @data = LabDatum.new(value: "Sample", unit: "uL", normal_range: "1.0-7.0")
  end

  test "blank value should be invalid" do
    @data.value = ""
    assert_not @data.valid?    
  end
end
