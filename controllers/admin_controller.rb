require './models/work_order'

get '/admin' do
    all_work_orders = all_work_orders()

    erb :'admin/manage', locals: {
        all_work_orders: all_work_orders
    }
end