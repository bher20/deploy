class AddApplicationIdToAppDeployments < ActiveRecord::Migration
  def change
    add_column :app_deployments, :application_id, :integer
  end
end
