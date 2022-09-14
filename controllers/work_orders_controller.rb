require './models/work_order'


get '/quotes/home' do 
    client_work_orders = client_work_orders(session['user_id'])

    redirect = redirect
  
    erb :'work_orders/quotes_page', locals: {
        all_work_orders: all_work_orders,
        client_work_orders: client_work_orders,
        redirect: redirect
    }
end

get '/work_orders/new' do
    erb :'work_orders/new'
end
  
post '/work_orders' do
    if params['name'] == ''
        then name = 'Generic enquiry'
    else
        name = params['name']
    end

    if params['description'] == ''
        then description = 'No description'
    else
        description = params['description']
    end

    if params['image_url'] == ''
        then image_url = 'https://www.feelinggoodinstitute.com/public/gallery/NoImageAvailableIcon.png'
    else
        image_url = params['image_url']
    end

    create_work_order(name, description, image_url)
  
    redirect '/quotes/home'
end
  
get '/work_orders/:id/edit' do
    id = params['id']
    work_order = get_work_order(id)
  
    erb :'work_orders/edit', locals: {
      work_order: work_order
    }
end
  
put '/work_orders/:id' do
    id = params['id']
    name = params['name']
    image_url = params['image_url']
  
    update_work_order(id, name, image_url)
    redirect '/quotes/home'
end
  
delete '/work_orders/:id' do
    id = params['id']
    
    delete_work_order(id)
    redirect '/quotes/home'
end

