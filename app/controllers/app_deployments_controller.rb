class AppDeploymentsController < ApplicationController
  load_and_authorize_resource
  include ApplicationHelper
  before_filter :load_application, :only => [:new, :create]

  # GET /app_deployments/1
  # GET /app_deployments/1.json
  def show
    @app_deployment = AppDeployment.find(params[:id])
    @application = @app_deployment.application

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @app_deployment }
    end
  end

  # GET /app_deployments/new
  # GET /app_deployments/new.json
  def new
    @app_deployment = @application.app_deployments.new(params[:app_deployment])

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @app_deployment }
    end
  end

  # GET /app_deployments/1/edit
  def edit
    @app_deployment = AppDeployment.find(params[:id])
  end

  # POST /app_deployments
  # POST /app_deployments.json
  def create
    @app_deployment = @application.app_deployments.new(params[:app_deployment])

    respond_to do |format|
      if @app_deployment.save
        format.html { redirect_to @app_deployment, notice: 'App deployment was successfully created.' }
        format.json { render json: @app_deployment, status: :created, location: @app_deployment }
      else
        format.html { render action: "new" }
        format.json { render json: @app_deployment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /app_deployments/1
  # PUT /app_deployments/1.json
  def update
    @app_deployment = AppDeployment.find(params[:id])

    respond_to do |format|
      if @app_deployment.update_attributes(params[:app_deployment])
        format.html { redirect_to @app_deployment, notice: 'App deployment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @app_deployment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /app_deployments/1
  # DELETE /app_deployments/1.json
  def destroy
    @app_deployment = AppDeployment.find(params[:id])
    @app_deployment.destroy

    respond_to do |format|
      format.html { redirect_to app_deployments_url }
      format.json { head :no_content }
      format.js
    end
  end

  def deploy
    @app_deployment = AppDeployment.find(params[:id])
    environment = Environment.find(params[:environment])
    force = to_boolean(params[:force])
    @deployment_log = DeploymentLog.new(:app_deployment => @app_deployment, :environment => environment)
    @deployment_log.message = t('app_deployments.queued')
    @deployment_log.log ||= Array.new
    @deployment_log.log.push(t('app_deployments.queued'))

    @deployment_log.save


    Delayed::Job.enqueue HookDeploymentJob.new(@app_deployment, @deployment_log, environment, force)

    @app_deployment.deployment_logs << @deployment_log
    @app_deployment.save!

    respond_to do |format|
      format.js { render 'success_deployment.js.erb' }
    end
  end

  private
  def load_application
    @application = Application.find(params[:application_id])
  end
end
