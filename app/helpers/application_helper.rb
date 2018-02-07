module ApplicationHelper
  def full_title(page_title = '')
    base_title = 'CryptoTrader'
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end

  def getBTCPrice()
    url = "https://api.coindesk.com/v1/bpi/currentprice.json"
    uri = URI(url)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true

    request = Net::HTTP::Get.new(uri.path, {'Content-Type' => 'application/json'})
    response = http.request(request)
    
    @responseValue = JSON.parse(response.body)
    
    @responseValue["bpi"]["USD"]["rate"].gsub(/[^\d\.]/, '').to_f
  end
end
