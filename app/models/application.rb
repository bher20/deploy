class Application < ActiveRecord::Base
  attr_accessible :name, :repository, :script, :environments

  has_attached_file :script

  validates :script, :attachment_presence => true

  has_many :environments
end
