class SlowFoodApp
  post '/order_create' do
    product = Product.find(params['product_id'])
    if session[:order_id]
      order = Order.find(session[:order_id])
    else
      order = Order.create
      session[:order_id] = order.id
    end
    order_item = OrderItem.create(product: product, order: order)
    redirect '/', notice: "#{order_item.product.name} was added to your order"
  end

  get '/checkout' do
    @order = order
    erb :checkout
  end

  post '/finalize' do
    if current_user
      order.update_attributes(status: 'confirmed', user: current_user)
      @pickup_time = pickup_time
      # Send email to restaurant
      session[:order_id] = nil
      erb :finalized
    else
      redirect '/checkout', notice: 'You need to login before finalizing order'
    end

  end
end