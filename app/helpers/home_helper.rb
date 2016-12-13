module HomeHelper
  def get_percentages(valueArr)
    percentageHash = {}
    total = 0
    if valueArr.size !=0
      percentageHash,total = get_count(valueArr)
      percentageHash.each do |key, value|
        percentageHash[key] = (value / total.to_f)
      end
      return percentageHash
    end
  end

  def get_count(valueArr)
    total = 0
    countHash = {}
    valueArr.each do |value|
      countHash[value] = countHash[value] == nil ? 1 : countHash[value] + 1
      total +=1
    end
    return countHash,total
  end

  def get_day_work_hour(statesData)
    old_time = 0 
    is_working = false
    total = 0
    statesData.each do |state|
      total += state.updated_at - state.created_at
    end
    return (total/(60*60))
  end

  def get_average_feeling(feelingData)
    ratioHash = get_percentages(feelingData)
    maxEntry = []
    maxValue  = 0
    unless ratioHash == nil
      ratioHash.each do |k,v|
        if v > maxValue
          maxValue = v
          maxEntry = [k,v]
        end
      end
    end
  end
  
  def formatted_duration total_seconds
    hours = total_seconds / (60 * 60)
    minutes = (total_seconds / 60) % 60
    seconds = total_seconds % 60
    "#{ hours } h #{ minutes } m #{ seconds } s"
  end

end
