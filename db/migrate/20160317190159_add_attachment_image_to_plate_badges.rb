class AddAttachmentImageToPlateBadges < ActiveRecord::Migration
  def self.up
    change_table :plate_badges do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :plate_badges, :image
  end
end
