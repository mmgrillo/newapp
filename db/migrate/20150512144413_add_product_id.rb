class AddProductId < ActiveRecord::Migration
  def change
  	add_column :products, :key, :integer
  end
end
