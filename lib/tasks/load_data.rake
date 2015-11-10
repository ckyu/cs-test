namespace :demo do
  task :load_data => :environment do
    session = ActionDispatch::Integration::Session.new(Rails.application)
    session.post "/token", {application_key: Rails.application.config.application_key}

    puts session.response.body

    token = session.response.body
    payload = '{
    "1234567891": {"Urinalysis": {"date": "2014-11-21","location": "TARDIS","physician": "David Tennant","data": {"Color": {"value": "Pale Yellow"},"Appearance": {"value": "Clear"},"Specific Gravity": {"value": 1.016,"normal_range": "1.010  1.030"},"pH": {"value": 7.0,"normal_range": "4.8-7.4"}}}}}'
    
    puts payload
    session.post "/save", {token: token, payload: payload}
  end
end