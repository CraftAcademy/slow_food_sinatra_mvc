class SlowFoodApp
  get '/users' do
    @users = User.all
    erb :users_index
  end
end


