class AddAttachmentDeploymentToAppDeployments < ActiveRecord::Migration
  def self.up
    change_table :app_deployments do |t|
      t.attachment :deployment
    end
  end

  def self.down
    drop_attached_file :app_deployments, :deployment
  end
end
