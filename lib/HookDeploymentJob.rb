class HookDeploymentJob < DeploymentJob
  def enqueue(job)
    #record_stat 'newsletter_job/enqueue'
    puts 'deployment_job/enqueue'
  end

  def perform
    deployment.deploy_application(environment, force)
  end

  def before(job)
    #record_stat 'newsletter_job/start'
    deployment_log.successful = nil
    deployment_log.message = 'Deployment started...'
    deployment_log.log.push('Deployment started...')

    deployment_log.save!
  end

  def after(job)
    #record_stat 'newsletter_job/after'
  end

  def success(job)
    puts 'QAPLA!'
    deployment_log.successful = true
    deployment_log.message = 'Successfully Deployed'
    deployment_log.log.push('Successfully Deployed')
    deployment_log.date = Time.now

    deployment_log.save!
  end

  def error(job, exception)
    #TODO: Clean up the exception message that gets set for the deployment_log object.
    puts 'ERROR!'
    deployment_log.successful = false

    case exception
      when InvalidDeployScript
        message = 'Syntax error in deployment script.'
      when Git::GitExecuteError
        message = 'No new files in deployment package.'
      when Archive::Zip::UnzipError
        message = 'Invalid Deployment Package Uploaded.'
      else
        message = exception.message
    end

    deployment_log.message = message
    deployment_log.log.push(message)
    deployment_log.date = Time.now

    deployment_log.save!
  end

  def failure
    puts 'FAILURE!'
    #deployment_log.successful = false
    #deployment_log.message = "Deployment Failed"

    #deployment_log.save!
  end
end