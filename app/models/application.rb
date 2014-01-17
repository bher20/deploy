class Application < ActiveRecord::Base
  attr_accessible :name, :repository, :script, :environments

  has_attached_file :script

  validates :script, :attachment_presence => true
  validates :name, presence: true, uniqueness: true
  validates :repository, presence: true

  has_many :environments
  has_many :app_deployments
  accepts_nested_attributes_for :environments
end
