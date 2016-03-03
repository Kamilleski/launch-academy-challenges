require "net/http"
require "json"

class Geolocation
  attr_reader :ip

  def initialize(ip)
    @ip = ip
    @data = get_location
    @data = default_location if city.empty?
  end

  def city
    @data["city"]
  end

  def state
    @data["region_name"]
  end

  def country
    @data["country_name"]
  end

  def zip
    @data["zip_code"]
  end

  private
  def get_location
    JSON.parse(response.body)
  end

  def uri
    URI("http://freegeoip.net/json/#{@ip}")
  end

  def default_location
    {
      "ip" => @ip,
      "country_code" => "US",
      "country_name" => "United States",
      "region_code" => "CA",
      "region_name" => "California",
      "city" => "San Francisco",
      "zip_code" => "94122",
      "time_zone" => "America/Los_Angeles",
      "latitude" => 37.7646056,
      "longitude" => -122.4673584,
      "metro_code" => 807
    }
  end
end
