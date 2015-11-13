class PatientsController < ApplicationController
  before_action :set_patient, only: [:show]

  # GET /patients
  # GET /patients.json
  def index
    @patients = Patient.all
  end

  # GET /patients/1
  # GET /patients/1.json
  def show
    @patient = Patient.find_by_ssn(params[:ssn])
    if @patient.nil?
      render nothing: true, status: 404
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_patient
      @patient = Patient.find_by_ssn(params[:ssn])
    end

end
