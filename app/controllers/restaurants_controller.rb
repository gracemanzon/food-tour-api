class RestaurantsController < ApplicationController
  def index
    require "uri"
    require "net/http"
    require "openssl"

    url = URI("https://worldwide-restaurants.p.rapidapi.com/search")

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Post.new(url)
    request["content-type"] = "application/x-www-form-urlencoded"
    request["X-RapidAPI-Key"] = "#{Rails.application.credentials.wwr_api}"
    request["X-RapidAPI-Host"] = "worldwide-restaurants.p.rapidapi.com"
    request.body = "language=en_US&limit=30&location_id=60795&currency=USD"

    response = http.request(request)
    puts response.read_body
  end
end
