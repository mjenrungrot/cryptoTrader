require 'net/http'
require 'json'

class StaticPagesController < ApplicationController
  def home
    url = "https://api.coindesk.com/v1/bpi/currentprice.json"
    uri = URI(url)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true

    request = Net::HTTP::Get.new(uri.path, {'Content-Type' => 'application/json'})
    response = http.request(request)
    
    @responseValue = JSON.parse(response.body)
  end

  def help
  end

  def about
  end

end
