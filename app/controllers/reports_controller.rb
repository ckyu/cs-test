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

    @reports.each do |name, raw_report_data| 
      report = @patient.reports.build
      report.name = name
      report.physician = raw_report_data[:physician] || ""
      report.date = raw_report_data[:date] || ""
      report.location = raw_report_data[:location] || ""
      if report.save
        logger.debug "Report saved!"
      else
        logger.debug "Something went wrong!"
      end
    end
  end

  private

    def report_params
      params.require(:report).permit(:name, :physician, :date, :location)
    end

end
