class CreateAppDeployments < ActiveRecord::Migration
  def change
    create_table :app_deployments do |t|
      t.string :version

      t.timestamps
    end
  end
end
