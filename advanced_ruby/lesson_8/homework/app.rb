require "sinatra/base"
require "sinatra/activerecord"
require_relative "application"

class App < Sinatra::Application
  set :method_override, true
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

  get '/cars/:id' do
    @car = Car.find(params[:id])
    erb :car
  end

  # update resource
  patch '/cars/:id' do
    params.delete(:_method)

    @car = Car.find(params[:id])
    @car.update(params)

    redirect :cars
  end

  delete '/cars/:id' do
    params.delete(:_method)

    @car = Car.find(params[:id])
    @car.destroy

    redirect :cars
  end

  run! if app_file == $0
end
