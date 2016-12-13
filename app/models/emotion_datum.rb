class EmotionDatum < ApplicationRecord
  belongs_to :person
  scope :get_day_emotions, ->{EmotionDatum.select(:feeling).where(created_at: (Time.now-(60*60*24))..Time.now)}
  scope :get_30minutes_emotions, -> {EmotionDatum.select(:feeling).where(created_at: Time.now-(30*60)..Time.now)}

end
