class Patient < ActiveRecord::Base
  has_many :reports
  # Gender (https://iterativo.wordpress.com/2010/12/26/modeling-a-discrete-property-in-a-rails-entity/)
  MALE   = { :value => 0, :display_name => "Male" }
  FEMALE = { :value => 1, :display_name => "Female" }

  # Validation 
  validates :ssn, length: {is: 10, message: 'must be exactly %{count} digits'}
  validates_inclusion_of :gender, :in => [MALE[:value], FEMALE[:value]]
  
  # Override this method so that Rails uses 
  # :ssn in routes instead of :id
  def to_param
    ssn
  end

  # Returns proper gender string
  def gender_displayname
    gender == MALE[:value] ? MALE[:display_name] : FEMALE[:display_name]
  end
end
