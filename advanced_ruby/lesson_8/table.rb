require 'net/http'
require 'json'
require 'awesome_print'

class Table
  attr_accessor :url

  def initialize(url, auth_token = '')
    @url = url
    @auth_token = auth_token
  end

  def get_data
    uri = URI(@url)
    set_connection(uri)

    req = Net::HTTP::Get.new(uri)
    req['Authorization'] = "Bearer #{@auth_token}"

    parse_response(req)
  end

  def post_data(body)
    uri = URI(@url)
    set_connection(uri)

    req = Net::HTTP::Post.new(uri)
    req['Authorization'] = "Bearer #{@auth_token}"
    req['Content-Type']  = "application/json"
    req.body             = body.to_json

    parse_response(req)
  end

  private

  def parse_response(request)
    res = @http.request(request)
    JSON.parse(res.body)
  end

  def set_connection(uri)
    @http = Net::HTTP.new(uri.host, uri.port)
    @http.use_ssl = true if uri.instance_of?(URI::HTTPS)
  end
end
