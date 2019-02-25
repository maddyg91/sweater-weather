class ForecastFacade
  def initialize(location)
    @location = location
  end

  def forecast
    Forecast.new(service)
  end

  def times
    service[:daily][:data].map do |time|
      time[:time]
    end
  end

  def summaries
    service[:daily][:data].map do |time|
      time[:summary]
    end
  end

  def gifs
    service[:daily][:data].map do |time|
      GifsFacade.new(time[:icon]).gif
    end
  end

  def images
    [{ time: times[0],
       summary: summaries[0],
       url: gifs[0]},
     { time: times[1],
       summary: summaries[1],
       url: gifs[1]},
     { time: times[2],
       summary: summaries[2],
       url: gifs[2]},
     { time: times[3],
       summary: summaries[3],
       url: gifs[3]},
     { time: times[4],
       summary: summaries[4],
       url: gifs[4]}]
  end

  def service
   DarkSkyService.forecast(@location)
  end
end
