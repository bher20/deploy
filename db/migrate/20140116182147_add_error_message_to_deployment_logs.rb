class AddErrorMessageToDeploymentLogs < ActiveRecord::Migration
  def change
    add_column :deployment_logs, :error_message, :string
  end
end
