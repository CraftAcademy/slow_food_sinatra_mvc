class SlowFoodApp
  get '/' do
    @categories = Product::VALID_CATEGORIES
    @products = Product.all
    erb :welcome
  end

  get '/login' do
    erb :signin
  end

  get '/signup' do
    erb :signup
  end

  get '/logout' do
    session[:user_id] = nil
    redirect '/', notice: 'You are no longer logged in'
  end

  get '/users' do
    @users = User.all
    erb :users_index
  end

  post '/register' do
    user_params = params['user']
    user = User.new(user_params)
    if user.save
      user.authenticate(user_params['password'])
      redirect '/', notice: "Thank you for signing up #{user.name}"
    else
      error_message = ''
      user.errors.full_messages.each {|message| error_message += message + ' '}
      redirect '/signup', notice: error_message
    end

  end

  post '/signin' do
    user = User.find_by(name: params['user']['name'])
    if user && user.authenticate(params['user']['password'])
      session[:user_id] = user.id
      redirect '/', notice: "Welcome #{current_user.name}! You were successfully logged in."
    else
      redirect '/login', notice: 'Incorrect user name or password'
    end
  end
end





