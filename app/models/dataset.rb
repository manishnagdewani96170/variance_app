class Dataset < ApplicationRecord
  #validations
  validates :temperature, numericality: { greater_than_or_equal_to: -273.15 }
end
