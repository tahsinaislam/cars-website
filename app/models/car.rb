class Car < ApplicationRecord
  validates :year, numericality: { less_than_or_equal_to: 2023 }
end
