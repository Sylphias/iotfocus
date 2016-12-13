class TotemDatum < ApplicationRecord
  belongs_to :person

    def init
      self.is_current_state ||= true
    end

  scope :get_day_states, ->{TotemDatum.where(created_at: (Time.now-(60*60*24))..Time.now)}

end
