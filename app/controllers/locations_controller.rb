class LocationsController < ApplicationController
  require "uri"
  require "net/http"
  require "openssl"

  def index
    location = params["location"]

    url = URI("https://worldwide-restaurants.p.rapidapi.com/typeahead")

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Post.new(url)
    request["content-type"] = "application/x-www-form-urlencoded"
    request["X-RapidAPI-Key"] = "#{Rails.application.credentials.wwr_api}"
    request["X-RapidAPI-Host"] = "worldwide-restaurants.p.rapidapi.com"
    request.body = "q=#{location}&language=en_US"

    response = http.request(request)
    puts response.read_body
    render json: response.read_body.as_json
  end
end
