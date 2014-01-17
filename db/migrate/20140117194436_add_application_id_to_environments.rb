class AddApplicationIdToEnvironments < ActiveRecord::Migration
  def change
    add_column :environments, :application_id, :integer
  end
end
