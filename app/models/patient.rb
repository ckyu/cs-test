class Patient < ActiveRecord::Base
  # before_save { self.ssn = ssn.to_i }  # force all emails to be lowercase before saving to db

  validates :ssn, numericality: { greater_than: 99999999, less_than: 10000000000, message: 'must be 10 digits.'}

  # Override this method so that Rails uses 
  # :ssn in routes instead of :id
  def to_param
    ssn
  end
end
