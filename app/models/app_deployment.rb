class AppDeployment < ActiveRecord::Base
  attr_accessible :version, :deployment

  has_attached_file :deployment

  validates :deployment, :attachment_presence => true

  belongs_to :application
  has_many :deployment_logs


  def deploy_application(environment)
    logger.debug "Deploying #{self.deployment_file_name} into #{environment.name} for #{application.name}."

    deployment = Deployment.new environment.path, application.repository, self.version, application.name, Rails.logger

    require_relative self.application.script.path

    time_stamp = Time.now.strftime("%Y-%m-%d%H_%M_%S")
    temp_dir = Rails.root.join('tmp', "#{time_stamp}-#{application.name}-archive")
    deploy ({ :temp_dir => temp_dir, :deploy_file => self.deployment.path, :environment => environment.name })

    deployment.deploy temp_dir, Rails.root.join('tmp', application.name)
  end
end
