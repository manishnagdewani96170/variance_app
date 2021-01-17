class TemperatureService

  attr_reader :temperatures

  def initialize(temperatures)
    @temperatures = temperatures
  end

  def calculate_variance
    sum_of_temperature_squares / (total_temperature_records - 1)
  end
  
  def calculate_mean
    temperature_sum / total_temperature_records
  end

  private
  def temperature_sum
    temperatures.sum
  end
    
  def total_temperature_records
    temperatures.size
  end 

  def sum_of_temperature_squares
    mean = calculate_mean
    temperatures.inject(0) { |result, element| ((element - mean) ** 2) + result }
  end 

end  