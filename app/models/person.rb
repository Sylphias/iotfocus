class Person < ApplicationRecord
  has_many :SeatDatum, dependent: :destroy
  has_many :EmotionDatum, dependent: :destroy
  has_many :TotemDatum, dependent: :destroy


end
