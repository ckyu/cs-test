class Token < ActiveRecord::Base
  before_create :generate_access_token
  validates :token, uniqueness: true

  def expired?
    Time.now > self.expires_on
  end

  private

    def generate_access_token
      begin
        self.token = SecureRandom.hex(6)
        logger.debug(self.token)
      end while self.class.exists?(token: token)
      self.expires_on = 5.seconds.from_now.utc
    end
end
