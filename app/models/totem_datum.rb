class TotemDatum < ApplicationRecord
  belongs_to :person

    def init
      self.is_current_state ||= true
    end

  scope :get_day_states, ->{TotemDatum.select(:state).where(created_at: (Date.today-1)..Date.today)}

end
