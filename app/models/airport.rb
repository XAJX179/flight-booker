class Airport < ApplicationRecord
  validates_uniqueness_of :code
  validates_length_of :code, is: 3
  validates_length_of :name, minimum: 10
end
