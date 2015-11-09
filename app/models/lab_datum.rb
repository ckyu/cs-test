class LabDatum < ActiveRecord::Base
  belongs_to :report

  validates :value, presence: true
end
