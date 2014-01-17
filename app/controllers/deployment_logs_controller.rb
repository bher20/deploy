class DeploymentLogsController < ApplicationController
  load_and_authorize_resource

  # GET /deployment_logs
  # GET /deployment_logs.json
  def index
    @deployment_logs = DeploymentLog.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @deployment_logs }
    end
  end
end
