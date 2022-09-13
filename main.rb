require 'sinatra'
require 'bcrypt'
require './db/db'

enable :sessions

get '/' do
  work_orders = all_work_orders()

  erb :index, locals: {
      work_orders: work_orders
  }
end

require './controllers/work_orders_controller'
require './controllers/users_controller'
require './controllers/sessions_controller'
require './helpers/sessions_helper'







