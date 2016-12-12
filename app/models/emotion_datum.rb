class EmotionDatum < ApplicationRecord
  belongs_to :person
  scope :get_day_emotions, -> (start_date, end_date){EmotionDatum.select(:feeling).where(created_at: start_date..end_date)}

end
