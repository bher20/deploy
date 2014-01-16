class AppDeployment < ActiveRecord::Base
  attr_accessible :version, :deployment

  has_attached_file :deployment

  validates :deployment, :attachment_presence => true

  belongs_to :application
  has_many :deployment_logs


  def deploy_application(environment)
    logger.debug "Deploying #{self.deployment_file_name} into #{environment.name} for #{application.name}."

    deployment = Deployment.new environment.path, application.repository, self.version, application.name, Rails.logger


    time_stamp = Time.now.strftime("%Y-%m-%d%H_%M_%S")
    temp_dir = Rails.root.join('tmp', "#{time_stamp}-#{application.name}-archive")

    begin
      script = self.application.script.path
      require_relative script
      deploy ({ :temp_dir => temp_dir, :deploy_file => self.deployment.path, :environment => environment.name })
    rescue Exception => e
      raise InvalidDeployScript.new, e
    end

    deployment.deploy temp_dir, Rails.root.join('tmp', application.name)
  end
end
