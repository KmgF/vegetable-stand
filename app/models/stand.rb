class Stand < ApplicationRecord
  validates :street_address, presence: true
end
