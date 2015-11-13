class LabDatum < ActiveRecord::Base
  belongs_to :report
  attr_accessor :value_min, :value_max
  validates :value, presence: true

  def label
    parse_normal_range
    if self.critical? 
      return "critical" 
    elsif self.warning? 
      return "warning"
    else
      return ""
    end
  end

  def warning?
    if !numeric?(self.value) && self.normal_range == ""
      return false
    end

    parse_normal_range
    # consider doing an if-else instead of this
    # maybe it's more costly?
    (0.9*@value_min...@value_min).include?(self.value.to_f) ||
    (@value_max...1.1*@value_max).include?(self.value.to_f)
  end

  def critical?
    if !numeric?(self.value) && self.normal_range == ""
      return false
    end

    parse_normal_range
    if self.value.to_f < 0.9 * @value_min || self.value.to_f > 1.1 * @value_max
      return true
    else
      return false
    end
  end

  private
    # Parses the normal_range string.
    # This assumes that the minimum value, when unspecified, is 0 (never negative).
    # Only understands strings of the form:
    #   "a - b", "> a", ">= a", "< b", "<= b"
    # Probably also fails when there's a negative value.
    def parse_normal_range
      if self.normal_range.include?("-")
        @value_min, @value_max = self.normal_range.split("-")
        @value_min = @value_min.to_f
        @value_max = @value_max.to_f
      elsif index = self.normal_range.index("<")
        @value_min = 0
        index ||= self.normal_range.index("=")
        index += 1
        @value_max = self.normal_range[index..-1].to_f
      elsif index = self.normal_range.index(">")
        index ||= self.normal_range.index("=")
        index += 1
        @value_min = self.normal_range[index..-1].to_f
        @value_max = Float::INFINITY
      end
    end

    def numeric?(string)
      Float(string) != nil rescue false
    end
end
