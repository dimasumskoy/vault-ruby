require 'sinatra/base'
require 'securerandom'
require 'json'

class Api < Sinatra::Application
  configure do
    set :access_token, SecureRandom.hex(10)
  end

  helpers do
    def authenticate!
      halt 401, 'Unauthorized' unless token_valid?
    end

    def token_valid?
      request.env["HTTP_AUTHORIZATION"] == settings.access_token
    end
  end

  get '/api' do
    app_info
  end

  get '/api/list_users' do
    authenticate!

    content_type :json
    read_users_data
  end

  post '/api/create_user' do
    authenticate!

    new_record = request.body.read
    record_data = JSON.parse(new_record)

    records = JSON.parse(read_users_data)
    records['records'] << record_data

    save_users_data(records)
  end

  get '/api/token' do
    settings.access_token
  end

  private

  def save_users_data(data)
    File.open('users.json', 'w') do |f|
      f.write(data.to_json)
    end
  end

  def read_users_data
    File.read('users.json')
  end

  def app_info
    'This is my first API!'
  end

  run! if app_file == $0
end
