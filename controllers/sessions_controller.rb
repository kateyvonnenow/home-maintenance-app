require './models/user'

get '/sessions/new' do
    erb :'sessions/new'
end

post '/sessions' do
    email = params['email']
    password = params['password']

    user = find_user_by_email(email)

    if user && BCrypt::Password.new(user['password_digest']) == password && user["admin"] == "t"
        session['user_id'] = user['id']

        redirect '/admin'
    elsif user && BCrypt::Password.new(user['password_digest']) == password
        session['user_id'] = user['id']

        redirect '/quotes/home'
    else
        erb :'sessions/retry'
    end
end

delete '/sessions' do
    session['user_id'] = nil

    redirect '/'
end