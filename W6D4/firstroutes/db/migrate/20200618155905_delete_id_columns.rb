class DeleteIdColumns < ActiveRecord::Migration[5.2]
  def change
    remove_column :artworks, :artworks
    remove_column :artwork_shares, :artwork_shares
  end
end
