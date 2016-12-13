class HomeController < ApplicationController
include HomeHelper
def index

  # Get the states of everybody in the day. how much time spent doing what
  @day_states = get_percentages(TotemDatum.get_day_states().pluck(:state))
  if @day_states !=nil
    gon.day_states_keys = @day_states.keys
    gon.day_states_values = @day_states.values
  end

  #Gettting the general mood of the company
  @day_emotions = get_percentages(EmotionDatum.get_day_emotions.pluck(:feeling))
  if @day_emotions != nil
    top_emotion = @day_emotions.max_by{|k,v| v}
    @day_top_emotion = top_emotion[0]
  end

  #Get the most hardworking people and the people who are emotionally troubled at the moment
  @all_people = Person.all
  work_hour = {}
  @bad_emotion_average = {}

  @all_people.each do |person|
    day_emotion = person.TotemDatum.get_day_states()
    day_hour = get_day_work_hour(day_emotion)
    unless day_hour == 0
      work_hour[person.name] = [day_hour, person.id] if day_emotion
    end
    @work_hour_hash = work_hour.sort_by {|_key, value| value}.reverse[0..2]
    moving_avg_emotion = get_average_feeling(person.EmotionDatum.get_30minutes_emotions)
    @bad_emotion_average[person.name] = [moving_avg_emotion,person.id] if moving_avg_emotion[0] == "Anger" || moving_avg_emotion[0] == "Sadness"
  end

  #TODO Get the longest Working hour workers
  #Create an announcement model to showeixt

end

def login
end

def announce
end

def emotion
end

end
