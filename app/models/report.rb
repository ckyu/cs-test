class Report < ActiveRecord::Base
  belongs_to :patient

  # retrieve records from most recent to oldest
  default_scope -> { order(date: :desc) }

  validates :patient_id, presence: true
end
