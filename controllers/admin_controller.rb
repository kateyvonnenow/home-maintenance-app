require './models/work_order'
require './models/user.rb'

get '/admin' do
    all_work_orders = all_work_orders()
    all_users = get_all_users()

    erb :'admin/manage', locals: {
        all_work_orders: all_work_orders,
        all_users: all_users
    }
end

