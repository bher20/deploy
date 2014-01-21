class Admin::UsersController < ApplicationController
  load_and_authorize_resource

  def index
    @users = User.all
    puts "Test"
  end

  def new
    @user = User.new
    @roles = User.valid_roles
  end

  def create
    @user = User.new(params[:user])
    if @user.save!
      flash[:notice] = "Successfully created User."
      redirect_to admin_users_path
    else
      render :action => 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
    @roles = @user.roles
  end

  def update
    @user = User.find(params[:id])
    params[:users].delete(:password) if params[:users][:password].blank?
    params[:users].delete(:password_confirmation) if params[:users][:password].blank? and params[:users][:password_confirmation].blank?
    if @user.update_attributes(params[:users])
      flash[:notice] = "Successfully updated User."
      redirect_to root_path
    else
      render :action => 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      flash[:notice] = "Successfully deleted User."
      redirect_to root_path
    end
  end
end
