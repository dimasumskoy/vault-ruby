require 'net/http'
require 'json'
require 'awesome_print'

class Table
  def get_data(url)
    uri = URI(url)
    set_connection(uri)

    req = Net::HTTP::Get.new(uri)
    req['Authorization'] = "Bearer #{API_KEY}"

    parse_response(req)
  end

  def post_data(url, body)
    uri = URI(url)
    set_connection(uri)

    req = Net::HTTP::Post.new(uri)
    req['Authorization'] = "Bearer #{API_KEY}"
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
