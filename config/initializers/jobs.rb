require 'DeploymentJob'
require 'HookDeploymentJob'
Delayed::Worker.destroy_failed_jobs = true
Delayed::Worker.max_attempts = 1