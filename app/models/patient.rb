class Patient < ActiveRecord::Base
  has_many :reports

  validates :ssn, length: {is: 10, message: 'must be exactly %{count} digits'}

  # Override this method so that Rails uses 
  # :ssn in routes instead of :id
  def to_param
    ssn
  end
end
