class RemovePlanFromPayments < ActiveRecord::Migration[5.0]
  def change
    remove_column :payments, :plan, :integer
  end
end
