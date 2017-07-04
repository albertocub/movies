class AddPlanToPayments < ActiveRecord::Migration[5.0]
  def change
    add_column :payments, :plan, :boolean
  end
end
