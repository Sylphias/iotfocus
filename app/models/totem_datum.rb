class TotemDatum < ApplicationRecord
  belongs_to :person
  scope :get_day_states, -> (start_date, end_date){TotemDatum.select(:state).where(created_at: start_date..end_date)}

end
