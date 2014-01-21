class DeploymentJob < Struct.new(:deployment, :deployment_log, :environment, :force)
end