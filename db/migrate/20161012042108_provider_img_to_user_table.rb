class ProviderImgToUserTable < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :provider_img, :string
  end
end
