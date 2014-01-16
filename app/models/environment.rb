class Environment < ActiveRecord::Base
  attr_accessible :name, :path, :application_id

  belongs_to :application
  has_many :deployment_logs, :through => :applications
end
