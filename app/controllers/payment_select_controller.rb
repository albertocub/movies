class PaymentSelectController < ApplicationController
	def select_plan
		@peliculafind = Pelicula.find(params[:pelicula])
		@user = User.find(params[:user])
	end
  	def select_monthly_subscription
  	end
end
