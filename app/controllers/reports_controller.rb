class ReportsController < ApplicationController

  def index
    appkey = Rails.application.config.application_key
    render :text => "#{appkey}\nlength: #{appkey.length}"
  end

  # POST /save
  def create
    payload = params[:payload]
    raw_token = params[:token]

    ssns = payload.keys
    ssn = ssns.first

    @token = nil unless Token.find_by(token: raw_token)

    @patient = Patient.find_by(ssn: ssn)
    @reports = payload[ssn]

    @reports.each do |name, raw_report| 
      report = @patient.reports.build({:name => name, :physician => raw_report[:physician], :location => raw_report[:location], :date => raw_report[:date]})
      if report.save
        data = raw_report[:data]  
        data.each do |name, raw_data|

          lab_datum = report.lab_data.build({:name => name, :value => raw_data[:value], :unit => raw_data[:unit] || "", :normal_range => raw_data[:normal_range] || ""})  
          if lab_datum.save
            logger.debug "Data saved!"
          else
            logger.debug "Data not saved..."
          end
        end
      else
        # send error message
        logger.debug "Something went wrong!"
      end # end report.save
    end # end reports.each
  end

  private

    def report_params
      params.require(:report).permit(:name, :physician, :date, :location)
    end

end
