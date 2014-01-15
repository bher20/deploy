class EnvironmentsController < ApplicationController
  before_filter :load_application, :except => [:destroy, :show, :index, :edit, :update]

  # GET /environments
  # GET /environments.json
  def index
    @environments = Environment.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @environments }
    end
  end

  # GET /environments/1
  # GET /environments/1.json
  def show
    @environment = Environment.find(params[:id])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: environment }
    end
  end

  def create
    @environment = @application.environments.new(params[:environment])

    if @environment.save
      respond_to do |format|
        format.html { redirect_to @application, :notice => t('environments.create_success') }
        format.js
      end
    else
      respond_to do |format|
        format.html { redirect_to @application, :alert => t('environments.create_failure') }
        format.js { render 'fail_create.js.erb' }
      end
    end
  end

  # GET /environments/new
  # GET /environments/new.json
  def new
    @environment = Environment.new

    respond_to do |format|
      format.js # new.html.erb
      format.json { render json: @environment }
    end
  end

  # GET /environments/1/edit
  def edit
    @environment = Environment.find(params[:id])
  end

  # PUT /environments/1
  # PUT /environments/1.json
  def update
    @environment = Environment.find(params[:id])

    respond_to do |format|
      if @environment.update_attributes(params[:environment])
        format.html { redirect_to(@environment, :notice => t('environments.update_success')) }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @environment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @environment = Environment.find(params[:id])
    @environment.destroy
    respond_to do |format|
      format.html { redirect_to @application.application_url, :notice => t('environments.destroy_success') }
      format.js
    end
  end

  private
  def load_application
    @application = Application.find(params[:application_id])
  end
end
