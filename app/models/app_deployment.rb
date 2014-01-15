class AppDeployment < ActiveRecord::Base
  attr_accessible :version, :environment_id, :deployment

  has_attached_file :deployment

  validates :deployment, :attachment_presence => true

  belongs_to :application

end
