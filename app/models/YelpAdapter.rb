module YelpAdapter

  include HTTParty

  base_uri 'https://api.yelp.com'


  def search(term, location)
    require 'uri'
require 'net/http'

  url = URI("https://api.yelp.com/v3/businesses/search?term=term&location=location&Authorization=Bearer%20VdO6on-3ofj_KJ0BxOcBkS9v-sMv2xH1wbOGBHknvg64Ulz_uWHdZY2kUvkM2m7qkRz3HKhS-ccfvUiPEoatMXg4DGaBOqUu2WDUDHRL_A0IfTMv5rmSk_T6xzDiWXYx")

  http = Net::HTTP.new(url.host, url.port)
  http.use_ssl = true
  http.verify_mode = OpenSSL::SSL::VERIFY_NONE

  request = Net::HTTP::Get.new(url)
  request["term"] = 'food'
  request["location"] = 'San Francisco'
  request["authorization"] = 'Bearer VdO6on-3ofj_KJ0BxOcBkS9v-sMv2xH1wbOGBHknvg64Ulz_uWHdZY2kUvkM2m7qkRz3HKhS-ccfvUiPEoatMXg4DGaBOqUu2WDUDHRL_A0IfTMv5rmSk_T6xzDiWXYx'
  request["cache-control"] = 'no-cache'
  request["postman-token"] = 'c5b59b21-37c2-364b-a427-1b083ffa1886'

  response = http.request(request)
  puts response.read_body

  results = JSON.parse(response.read_body)
  results["businesses"].each do |business|
    @business = Business.new()
    @business.name = business["name"]
    @business.street_address = business["location"]["address1"]
    @business.city = business["location"]["city"]
    @business.state = business["location"]["state"]
    @business.rating = business["rating"]
    @business.image_url = business["image_url"]
    end
  end



end