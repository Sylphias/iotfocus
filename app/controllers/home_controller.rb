class HomeController < ApplicationController
include HomeHelper
def index
  @day_states = get_percentages(TotemDatum.get_day_states(Date.today-1, Date.today).pluck(:state))
  if @day_states !=nil
    gon.day_states_keys = @day_states.keys
    gon.day_states_values = @day_states.values
  end

  @day_emotions = get_percentages(EmotionDatum.get_day_emotions(Date.today-1, Date.today).pluck(:feeling))
  if @day_emotions != nil
    top_emotion = @day_emotions.max_by{|k,v| v}
    @day_top_emotion = top_emotion[0]
  end
end

def login
end

def emotion
end

end
