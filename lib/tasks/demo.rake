require 'data_generator'

namespace :demo do
  desc "Send sample patient data via the API"
  task :load_data => :environment do
    (1...Patient.count+1).each do |cnt|
      # Generate random laboratory data for each patient
      patient = Patient.find(cnt)
      reports = DataGenerator::report rand(1..5)

      # Render in JSON
      payload = { patient.ssn => reports }
      payload = JSON.pretty_generate(payload)

      # Initialize session
      session = ActionDispatch::Integration::Session.new(Rails.application)

      # Get token
      session.post "/token", {application_key: "123456789abcdcaresharing"}
      token = session.response.body

      # Deliver patient information
      session.post "/save", {token: token, payload: payload}
    end
  end
end