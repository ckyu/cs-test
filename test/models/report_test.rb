require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  def setup
    @patient  = patients(:steven)
    @report   = @patient.reports.build(physician: "Albert Einstein",
                                      date: "2015-04-19",
                                      location: "Milliways")
  end

  test "should be valid" do
    assert @report.valid?
  end

  test "patient_id should be present" do
    @report.patient_id = nil
    assert_not @report.valid?
  end

end
