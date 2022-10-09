require 'httparty'
require 'json'

class DataFetcher
  include HTTParty

  API_HOST = 'https://xom-workbench.herokuapp.com/api/'.freeze
  KEY = '5b464f0dae14138f73c95416658bb8c31f508667e7bcc85a'.freeze

  def self.call(route, params)
    HTTParty.get(API_HOST + route, headers: auth(params), query: params)
  end

  def self.auth(params)
    hmac = OpenSSL::HMAC.hexdigest(OpenSSL::Digest.new('sha256'), KEY, params.to_json)
    { 'Authorization' => hmac }
  end
end
