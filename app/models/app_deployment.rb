class AppDeployment < ActiveRecord::Base
  attr_accessible :version, :deployment

  has_attached_file :deployment

  validates :deployment, :attachment_presence => true
  validates_uniqueness_of :version, :scope => :application_id
  validates :version, presence: true

  belongs_to :application
  has_many :deployment_logs


  def deploy_application(environment, force = false)
    logger.debug "Deploying #{self.deployment_file_name} into #{environment.name} for #{application.name}."


    time_stamp = Time.now.strftime("%Y-%m-%d%H_%M_%S")
    temp_dir = Rails.root.join('tmp', "#{time_stamp}-#{application.name}-archive")

    deployment = Deployment.new environment.path, application.repository, self.version, application.name, Rails.logger, Rails.root.join('tmp', application.name)

    begin
      script = self.application.script.path
      require_relative script
      deploy ({ :temp_dir => temp_dir, :deploy_file => self.deployment.path, :environment => environment.name })
    rescue Exception => e
      raise InvalidDeployScript.new, e
    end

    if !force || (force && deployment.version?(self.version))
      deployment.deploy temp_dir, force
    elsif force
      raise InvalidVersion.new, "A deployment with the version #{self.version} does not exist."
    end
  end
end
