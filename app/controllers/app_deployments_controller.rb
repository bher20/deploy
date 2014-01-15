class AppDeploymentsController < ApplicationController
  # GET /app_deployments
  # GET /app_deployments.json
  def index
    @app_deployments = AppDeployment.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @app_deployments }
    end
  end

  # GET /app_deployments/1
  # GET /app_deployments/1.json
  def show
    @app_deployment = AppDeployment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @app_deployment }
    end
  end

  # GET /app_deployments/new
  # GET /app_deployments/new.json
  def new
    @app_deployment = AppDeployment.new

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
    @app_deployment = AppDeployment.new(params[:app_deployment])

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
    end
  end
end
