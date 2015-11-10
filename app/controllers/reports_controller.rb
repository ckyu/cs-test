class ReportsController < ApplicationController

  before_action :authenticate

  # POST /save
  def create
    payload = JSON.parse(params[:payload])

    ssns = payload.keys
    ssn = ssns.first

    @patient = Patient.find_by(ssn: ssn)
    @reports = payload[ssn]

    @reports.each do |name, raw_report| 
      data = raw_report["data"] 
      report = @patient.reports.build({:name => name, :physician => raw_report["physician"], :location => raw_report["location"], :date => raw_report["date"]})
      if report.save
        data.each do |name, raw_data|
          logger.debug "name: #{name}\nraw_data: #{raw_data}"

          lab_datum = report.lab_data.build({:name => name, :value => raw_data["value"], :unit => raw_data["unit"] || "", :normal_range => raw_data["normal_range"] || ""})  
          logger.debug lab_datum.value

          if lab_datum.save
            logger.debug "Data saved!"
          else
            # render text: "ERROR: Malformed data.", status: 500 
            logger.debug "Data not saved..."
          end
        end
      else
        render text: "ERROR: Malformed data.", status: 500
        logger.debug "Something went wrong!"
      end # end report.save

      render text: "OK", :status => 200

    end # end reports.each
  end

  private

    def authenticate
      @token = Token.find_by(token: params[:token]) || nil
      if @token.nil? || @token.expired?
        render text: "ERROR: Invalid token.", status: 500
        # redirect_to "/", notice: "Your token is invalid."
      end
    end

    def report_params
      params.require(:report).permit(:name, :physician, :date, :location)
    end

end
