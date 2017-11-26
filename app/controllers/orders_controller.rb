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
    erb :checkout, layout: false
  end

  post '/finalize' do
    @order = order
    if current_user
      @order.update_attributes(status: 'confirmed', user: current_user)
      @pickup_time = pickup_time
      # Send email to restaurant
      send_emails({customer: current_user.email, restaurant: 'thomas@craftacademy.se'})
      session[:order_id] = nil
      erb :finalized, notice: 'Your order have been submitted We\'ve notified the restaurant....'
    else
      redirect '/', notice: 'You need to login before finalizing order'
    end

  end

  def send_emails(attrs={})
    from = Email.new(email: attrs[:customer])
    to = Email.new(email: attrs[:restaurant])
    subject = 'New order from SlowFood Online'
    content = Content.new(type: 'text/html', value: compose_body(attrs))
    mail = Mail.new(from, subject, to, content)

    mailer = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
    if Sinatra::Application.production? #|| Sinatra::Application.test? #enable for manual tests
      mailer.client.mail._('send').post(request_body: mail.to_json)
    else
      puts mail.to_json
    end
  end

  def compose_body(attrs={})
    email_body = "<h2>You have a new order from #{attrs[:customer]}</h2>"
    @order.order_items.each do |item|
      email_body += "<p>#{item.product.name} - #{item.product.price} </p>"
    end
    email_body += "<p>Paid on pickup: #{@order.total}kr </p>"
    email_body += "<strong>Pickup time: #{@pickup_time}</strong>"
    email_body
  end
end