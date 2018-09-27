module HomeHelper
    def location(lat, lon)
        
        response = HTTParty.get("http://api.openweathermap.org/data/2.5/weather?lat=#{lat},&lon=#{lon}&units=imperial&appid=#{Figaro.env.weather_api_key}")
        @json = JSON.parse(response.body)
        @temperature = @json["main"]["temp"]
        @windSpeed = @json["wind"]["speed"]
        @windDirection = @json["wind"]["deg"]
    end
end
