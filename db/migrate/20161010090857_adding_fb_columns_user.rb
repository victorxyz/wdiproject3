class AddingFbColumnsUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :provider, :string
    add_column :users, :provider_id, :string
    add_column :users, :provider_hash, :string
  end
end
