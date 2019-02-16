require 'telegram/bot'
require 'net/http'

class RailwaysBot
  TOKEN    = ENV['RAILWAYS_BOT_TOKEN']
  API_HOST = 'http://localhost:4567'

  def run
    Telegram::Bot::Client.run(TOKEN) do |bot|
      @bot = bot
      @bot.listen do |message|
        @message = message
        process_request
      end
    end
  end

  private

  def process_request
    case @message.text
    when '/start'
      @api_response = get("#{API_HOST}/api")
      send_message
    end
  end

  def send_message
    @bot.api.send_message(chat_id: @message.chat.id, text: @api_response.body)
  end

  def get(url)
    uri = URI(url)
    req = Net::HTTP::Get.new(uri)

    http         = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true if uri.instance_of?(URI::HTTPS)

    res = http.request(req)
    res
  end
end
