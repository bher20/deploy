class AddLogToDeploymentLogs < ActiveRecord::Migration
  def change
    add_column :deployment_logs, :log, :text
  end
end
