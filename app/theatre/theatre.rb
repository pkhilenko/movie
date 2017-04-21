class Theatre < MovieCollection
  MORNING = (9..13)
  DAY = (14..18) 
  EVENING = (19..24) 
  MORNING_SEANS = PERIODS[:ancient]
  DAY_SEANS = /Adventure|Comedy/
  EVENING_SEANS = /Drama|Horror/
  FILTERDAY = { genre: DAY_SEANS }
  FILTEREVENING = { genre: EVENING_SEANS }
  FILTERMORNING =  { year: PERIODS[:ancient]  }
  TIMES = {
    morning: MORNING,
    day: DAY,
    evening: EVENING
  }
  FILTRES = {
    morning: FILTERMORNING,
    day: FILTERDAY,
    evening: FILTEREVENING  
  }
  def show(hour)
    raise "В указанное время сеансов нет \n" unless (MORNING.first..EVENING.last).cover?(hour)
    period = TIMES.detect{ |p, hours| hours.cover?(hour) }[0]  
    filter(FILTRES[period]).each{ |f| f.description }
  end

  def when? 
    #
  end
end
