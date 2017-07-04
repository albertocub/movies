class AddPonercolumnasToUsers < ActiveRecord::Migration[5.0]
  def change
  	add_column :users, :avatar, :string
  	add_column :users, :marketing_mailer, :string
  	add_column :users, :marketing_mailer_date, :date
  	add_column :users, :username, :string
  end
end
