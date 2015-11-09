class ReportsController < ApplicationController

  def index
    render :text => "Hello!"
  end

  # POST /save
  def create
    payload = params[:payload]
    ssns = payload.keys
    logger.debug "#{ssns}"
    ssn = ssns.first

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
        data = raw_report_data[:data]
        
        data.each do |name, raw_data|
          lab_datum = report.lab_data.build
          lab_datum.name = name
          lab_datum.value = raw_data[:value]
          lab_datum.unit = raw_data[:unit] || ""
          lab_datum.normal_range = raw_data[:normal_range] || "" 

          if lab_datum.save
            logger.debug "Data saved!"
          else
            logger.debug "Data not saved..."
          end

        end

      else
        # send error message
        logger.debug "Something went wrong!"
      end
    end
  end

  private

    def report_params
      params.require(:report).permit(:name, :physician, :date, :location)
    end

end
