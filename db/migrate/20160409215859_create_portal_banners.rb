class CreatePortalBanners < ActiveRecord::Migration
  def change
    create_table :portal_banners do |t|
      t.string :title
      t.string :image
      t.string :link

      t.timestamps null: false
    end
  end
end
