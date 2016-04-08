class Admin::UsersController < ApplicationController

  load_and_authorize_resource

  def new
    @roles = Role.all
  end

  def show
  end

  def create
    if @user.save
      flash[:success] = t "admin.create_user.success"
      redirect_to root_url
    else
      flash[:danger] = t "admin.create_user.error"
      render :new
    end
  end

  def edit
    @roles = Role.all
  end

  def update
    if @user.update_attributes update_params
      flash[:success] = t "admin.update_user.success"
      redirect_to [:admin, @user]
    else
      render :edit
    end
  end

  def destroy
    if @user.destroy
      flash[:success] = t "admin.delete_user.success"
      redirect_to root_url
    else
      render :show
    end
  end

  private
  def create_params
    params.require(:user).permit :name, :email, :password,
      :password_confirmation, :role_id
  end
  def update_params
    if params[:user][:password].blank?
      params[:user].delete :password
      params[:user].delete :password_confirmation
    end
    params.require(:user).permit :name, :email, :password,
      :password_confirmation, :role_id
  end
end
