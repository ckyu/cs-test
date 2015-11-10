class LabDatum < ActiveRecord::Base
  belongs_to :report

  attr_accessor :value_min, :value_max

  validates :value, presence: true

  # before_save :parse_normal_range   # error if cannot be parsed

  private
    def parse_normal_range

    end

end
