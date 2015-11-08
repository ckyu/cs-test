class ReportsController < ApplicationController

  def index
    render :text => "Hello!"
  end

  # POST /save
  def create
    payload = params[:payload]
    ssns = payload.keys
    ssn = ssns.first
    # ssns.each do |ssn|
    @patient = Patient.find_by(ssn: ssn)
    @reports = payload[ssn]

    # @reports.each do |raw_report_data|
    #   report = Report.new
    #   report.name = 
    # end

      # render :text => "patient: #{@patient.name}<br>\n 
                       # report: #{reports}"
    
    # end
    # @report = Report.new(report_params)
    # render :text => "@var: #{@report.name}"
  end

  private

    def report_params
      params.require(:report).permit(:name, :physician, :date, :location)
    end

end
