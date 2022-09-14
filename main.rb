require 'sinatra'
require 'bcrypt'
require './db/db'

enable :sessions

get '/' do
  all_work_orders = all_work_orders()
  client_work_orders = client_work_orders(session['user_id'])

  erb :index, locals: {
      all_work_orders: all_work_orders,
      client_work_orders: client_work_orders
  }
end

require './controllers/work_orders_controller'
require './controllers/users_controller'
require './controllers/sessions_controller'
require './helpers/sessions_helper'







