require 'test_helper'

class LabDatumTest < ActiveSupport::TestCase
  def setup
    @data = LabDatum.new(value: "Sample", unit: "uL", normal_range: "1.0-7.0")
  end

  test "blank value should be invalid" do
    @data.value = ""
    assert_not @data.valid?    
  end

  test "critical value" do
    @data.normal_range = "1-5"
    @data.value = "10"
    @data.save
    assert @data.critical?
    assert_not @data.warning?
  end

  test "warning value" do
    @data.normal_range = "3-5"
    @data.value = "5.4"
    assert_not @data.critical?
    assert @data.warning?
    
    @data.value = "2.8"
    assert_not @data.critical?
    assert @data.warning?
  end

  test "non-numeric value should not be critical or warning" do
    assert_not @data.critical?
    assert_not @data.warning?
  end

end
