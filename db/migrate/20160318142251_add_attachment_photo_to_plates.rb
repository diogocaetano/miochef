class AddAttachmentPhotoToPlates < ActiveRecord::Migration
  def self.up
    change_table :plates do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :plates, :photo
  end
end
