class PatientsController < ApplicationController
  before_action :set_patient, only: [:show]

  # GET /patients
  def index
    @patients = Patient.all
    respond_to :html
  end

  # GET /patients/1
  def show
    if @patient.nil?
      render nothing: true, status: 404 and return
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_patient
      @patient = Patient.find_by_ssn(params[:ssn])
    end

end
