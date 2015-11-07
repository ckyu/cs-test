class Patient < ActiveRecord::Base
  validates :ssn, numericality: { greater_than: 999999999, less_than: 10000000000}
end
