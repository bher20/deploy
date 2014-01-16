class CreateDeploymentLogs < ActiveRecord::Migration
  def change
    create_table :deployment_logs do |t|
      t.timestamp :date
      t.integer :app_deployment_id
      t.integer :environment_id
      t.boolean :successful

      t.timestamps
    end
  end
end
