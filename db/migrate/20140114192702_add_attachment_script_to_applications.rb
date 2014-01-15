class AddAttachmentScriptToApplications < ActiveRecord::Migration
  def self.up
    change_table :applications do |t|
      t.attachment :script
    end
  end

  def self.down
    drop_attached_file :applications, :script
  end
end
