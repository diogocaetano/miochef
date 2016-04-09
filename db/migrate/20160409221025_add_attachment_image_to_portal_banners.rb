class AddAttachmentImageToPortalBanners < ActiveRecord::Migration
  def self.up
    change_table :portal_banners do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :portal_banners, :image
  end
end
