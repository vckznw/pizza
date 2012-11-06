class AddRememberTokenToCliente < ActiveRecord::Migration
  def change
    add_column :cliente, :remember_token, :string
    add_index :cliente, :remember_token
  end
end
