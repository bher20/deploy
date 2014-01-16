class DeploymentLog < ActiveRecord::Base
  attr_accessible :app_deployment_id, :date, :environment_id, :successful, :app_deployment, :environment, :error_message

  belongs_to :app_deployment
  belongs_to :environment

  before_create :set_timestamp

  private
    def set_timestamp
      self.date = Time.now
    end
end
