class Review < ApplicationRecord
  belongs_to :restaurant
  validates :content, :rating, presence: true
  validates :rating, numericality: { only_integer: true },
                     inclusion: { in: (0..5), message: 'rating must be an integer between 0 and 5' }
end
