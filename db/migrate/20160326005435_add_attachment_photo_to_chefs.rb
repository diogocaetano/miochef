class AddAttachmentPhotoToChefs < ActiveRecord::Migration
  def self.up
    change_table :chefs do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :chefs, :photo
  end
end
