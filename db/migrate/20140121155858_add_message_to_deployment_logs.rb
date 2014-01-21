class AddMessageToDeploymentLogs < ActiveRecord::Migration
  def change
    add_column :deployment_logs, :message, :text
  end
end
