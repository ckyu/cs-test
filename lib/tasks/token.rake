namespace :token do
  desc "Clears all expired tokens."
  task :clear => :environment do
    Token.where("expires_on < ?", Time.now).each do |token|
      token.destroy
    end
  end  
end