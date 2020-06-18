class CreateArtworks < ActiveRecord::Migration[5.2]
  def change
    create_table :artworks do |t|
      t.string :artworks, :title, null: false
      t.string :artworks, :image_url, null: false
      t.integer :artworks, :artist_id, null: false
    end
  end
end
