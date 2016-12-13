class EmotionDatum < ApplicationRecord
  belongs_to :person
  scope :get_day_emotions, ->{EmotionDatum.select(:feeling).where(created_at: (Time.now-(60*60*24))..Time.now)}
  scope :get_5minutes__emotions, -> {EmotionDatum.select(:feeling).where(created_at: Time.now-(5*60)..Time.now)}

end
