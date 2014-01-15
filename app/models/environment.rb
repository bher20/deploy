class Environment < ActiveRecord::Base
  attr_accessible :name, :path, :application_id

  belongs_to :application
end
