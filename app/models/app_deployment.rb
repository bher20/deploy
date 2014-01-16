class AppDeployment < ActiveRecord::Base
  attr_accessible :version, :deployment

  has_attached_file :deployment

  validates :deployment, :attachment_presence => true

  belongs_to :application


  def deploy(environment)
    puts environment
    #TODO: Use Deployer gem to deploy code.
  end
end
