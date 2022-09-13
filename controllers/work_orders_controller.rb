require './models/work_order'
  
get '/work_orders/new' do
    erb :'work_orders/new'
end
  
post '/work_orders' do
    name = params['name']
    description = params['description']
    image_url = params['image_url']
  
    create_work_order(name, description, image_url)
  
    redirect '/'
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
    redirect '/'
end
  
delete '/work_orders/:id' do
    id = params['id']
    
    delete_work_order(id)
    redirect '/'
end