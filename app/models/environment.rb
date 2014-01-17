class Environment < ActiveRecord::Base
  attr_accessible :name, :path, :application_id

  validates_uniqueness_of :name, :scope => :application_id
  validates :name, presence: true
  validates :path, presence: true

  belongs_to :application
  has_many :deployment_logs
end
