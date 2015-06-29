class ChangeProductKeyToString < ActiveRecord::Migration
  def up
    change_column :products, :key, :string, null: false
  end

  def down
    change_column :products, :key, :integer, null: false
  end
end
