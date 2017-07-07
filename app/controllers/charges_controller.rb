class ChargesController < ApplicationController
before_action :authenticate_user!
  def index
  end
  def new
    @user = User.find(params[:user])
    @@user = @user
    @amount = 500
    @@amount = @amount
    @pelicula = ""
    @@subscript = ""
    @tipoplan = ""
    if params[:amount]
      @amount = params[:amount]
      @@amount = @amount
      @pelicula = params[:pelicula]
    elsif params[:plan] == "bronze"
      @amount = 999
      @@amount = @amount
      @@subscript = :plan
      @tipoplan = "Bronze"
    elsif params[:plan] == "silver"
      @amount = 1299
      @@amount = @amount
      @@subscript = :plan
      @tipoplan = "Silver"
    elsif params[:plan] == "gold"
      @amount = 1999
      @@amount = @amount
      @@subscript = params[:plan]
      @tipoplan = "Gold"
    end
    

  end
  def create
    # Amount in cents
    @amount = @@amount
    @user = @@user
    @subscript = @@subscript
    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )
    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => 'Rails Stripe customer',
      :currency    => 'eur'
    )
    #current_user.payments.create(subscription: false, channel: "stripe", active: true, plan: 5, amount: 5)
    @payment = Payment.new
    @payment.user_id = current_user.id
    @payment.active = true
    if @subscript == "bronze" || @subscript == "silver" || @subscript == "gold"
      @payment.channel = "Stripe Pay subscript"
      @payment.subscription = true
      @payment.plan = true
      @payment.amount = @amount
      @payment.save
    else
      @payment.channel = "Stripe Pay Film"
      @payment.subscription = false
      @payment.plan = false
      @payment.amount = @amount
      @payment.save
    end  
    redirect_to settings_path
    rescue Stripe::CardError => e
      #flash[:error] = e.message
      redirect_to new_charge_path
  end
end