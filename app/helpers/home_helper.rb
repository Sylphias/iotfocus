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
      byebug
      if state["state"] = "Working" 
        is_working = true
        old_time = state["created_at"]
      end
      if is_working
        total += ((state["created_at"] -  old_time)/3600)
        is_working = false
      end

    end
    return total
  end

  def get_average_feeling(feelingData)
    ratioHash = get_percentages(feelingData)
    maxEntry = []
    maxValue  = 0
    ratioHash.each do |k,v|
      if v > maxValue
        maxValue = v
        maxEntry = [k,v]
      end
    end
  end
  
end
