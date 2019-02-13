require "sinatra"
require "sinatra/activerecord"
require_relative "application"

set :database, {
  adapter: 'postgresql',
  encoding: 'unicode',
  database: 'final_task_app',
  pool: 2,
  username: 'postgres',
  password: '34521'
}

get '/cars' do
  @cars = Car.all
  erb :cars
end

get '/trucks' do
  @trucks = Truck.all
  erb :trucks
end

post '/cars' do
  @car = Car.create(params)
  redirect :cars
end

post '/trucks' do
  @truck = Truck.create(params)
  redirect :trucks
end
