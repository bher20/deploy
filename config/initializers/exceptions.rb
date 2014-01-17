class InvalidDeployScript < StandardError
  attr_accessor :failed_action
  def initialize
    @failed_action = AppDeployment
  end
end

class InvalidVersion < StandardError
  attr_accessor :failed_action
  def initialize
    @failed_action = AppDeployment
  end
end