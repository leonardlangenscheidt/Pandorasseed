class AddDetailsToOrder < ActiveRecord::Migration
  def change
  	add_column :orders, :gift, :boolean
  	add_column :orders, :shipped, :boolean
  	add_column :orders, :premium, :boolean
  	add_column :orders, :message, :string
  	add_column :orders, :name, :string
  	add_column :orders, :street1, :string
  	add_column :orders, :street2, :string
  	add_column :orders, :city, :string
  	add_column :orders, :state, :string
  	add_column :orders, :zip, :integer
  end
end
