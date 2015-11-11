require 'data_generator'

namespace :demo do
  task :load_data => :environment do
    (1...Patient.count+1).each do |cnt|
      patient = Patient.find(cnt)
      reports = DataGenerator::report rand(1..5)
      payload = { patient.ssn => reports }
      payload = JSON.pretty_generate(payload)

      session = ActionDispatch::Integration::Session.new(Rails.application)
      session.post "/token", {application_key: Rails.application.config.application_key}

      token = session.response.body
      
      puts payload
      session.post "/save", {token: token, payload: payload}
    end
  end
end