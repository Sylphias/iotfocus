class EmotionDatum < ApplicationRecord
  belongs_to :person
  scope :get_day_emotions, ->{EmotionDatum.select(:feeling).where(created_at: (Date.today-1)..Date.today)}
  scope :get_5minutes__emotions, -> {EmotionDatum.select(:feeling).where(created_at: Time.now-(5*60)..Time.now)}

end
