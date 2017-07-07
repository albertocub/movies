class PaymentsController < ApplicationController
  helper_method :sort_column, :sort_direction
  def index
  	# @payment = current_user.payments.all.order("created_at DESC")
  	@payment = current_user.payments.order("#{sort_column} #{sort_direction}")
  end
private
  def sortable_columns
    ["id","created_at","amount"]
  end
  def sort_column
    sortable_columns.include?(params[:column]) ? params[:column] : "id"
  end
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end