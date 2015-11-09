class Report < ActiveRecord::Base
  belongs_to :patient
  has_many :lab_data

  # retrieve records from most recent to oldest
  default_scope -> { order(date: :desc) }

  validates :patient_id, presence: true
end
