class HomeController < ApplicationController
  require 'httparty'

  def index
    response = HTTParty.get("http://api.openweathermap.org/data/2.5/weather?id=4726206&units=imperial&appid=#{Figaro.env.weather_api_key}")
    @json = JSON.parse(response.body)
    @temperature = @json["main"]["temp"]
    @windSpeed = @json["wind"]["speed"]
    @windDirection = @json["wind"]["deg"]
  end
end
