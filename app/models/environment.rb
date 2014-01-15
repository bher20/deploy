class Environment < ActiveRecord::Base
  attr_accessible :name, :path, :application_id

  belongs_to :application

  def deploy (version)
    require 'deployer'
    deployment = Deployment.new self.path, self.application.repository, version, self.application.name, nil
  end
end
