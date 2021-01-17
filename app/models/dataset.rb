class Dataset < ApplicationRecord
  #validations
  validates :temperature, numericality: { greater_than_or_equal_to: -273.15 }

  scope :time_specific_temperatures, -> { where(recorded_at: DateTime.now - 1.minute).pluck(:temperature) }

  def self.get_variance
    temperatures = Dataset.time_specific_temperatures
    return 0 if temperatures.size <= 1
    TemperatureService.new(temperatures).calculate_variance
  end  
end
