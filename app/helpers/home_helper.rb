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

end
