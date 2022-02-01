class Meeting < ApplicationRecord
  validates :title, presence: true
  validates :location, presence: true
  validates :date, comparison: {greater_than: Time.now}

  has_many :presenters
  has_many :speakers, through: :presenters

end
