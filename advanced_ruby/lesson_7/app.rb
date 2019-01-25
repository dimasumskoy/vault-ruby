require 'sinatra'

helpers do
  def store_info(info)
    user_info = "#{info['first_name']} #{info['last_name']}, #{info['age']}"

    File.open('users.txt', 'a+') do |file|
      file.puts(user_info)
    end
  end

  def read_info
    return [] unless File.exist?('users.txt')
    File.read('users.txt').split("\n")
  end
end

get '/app' do
  erb :index
end

post '/info' do
  store_info(params)
  redirect '/users'
end

get '/users' do
  @users_info = read_info
  erb :users
end
