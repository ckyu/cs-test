require 'test_helper'

class PatientTest < ActiveSupport::TestCase

  def setup
    @patient = Patient.new( name: "Example",
                            date_of_birth: "01-01-1970",
                            gender: "female",
                            ssn: "1234567890" )
  end

  test "ssn too short" do
    @patient.ssn = ""
    assert_not @patient.valid?
  end

  test "ssn too long" do
    @patient.ssn = "1" * 11
    assert_not @patient.valid?
  end

end
