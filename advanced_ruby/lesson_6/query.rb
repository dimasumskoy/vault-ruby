require 'net/http'

class Query
  def get(url)
    uri = URI(url)
    req = Net::HTTP::Get.new(uri)

    http         = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true if uri.instance_of?(URI::HTTPS)

    res = http.request(req)
    res
  end
end
