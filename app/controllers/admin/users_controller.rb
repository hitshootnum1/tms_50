class Admin::UsersController < ApplicationController

  before_action :load_all_users, only: :index
  before_action :load_user, only: :index
  before_action :load_roles, only: [:index, :new, :edit]
  load_and_authorize_resource

  def index
    @from = params[:from]
  end

  def new
    ajax_respond
  end

  def create
    if @user.save
      flash[:success] = t "user.create_success"
      redirect_to :back
    else
      flash.now[:danger] = t "user.create_error"
      render :index
    end
  end

  def edit
    ajax_respond
  end

  def update
    if params[:user][:password].blank?
      params[:user].delete :password
      params[:user].delete :password_confirmation
    end
    if @user.update_attributes user_params
      flash[:success] = t "user.update_success"
      redirect_to :back
    else
      flash[:danger] = t "user.update_error"
      render :index
    end
  end

  def destroy
    if @user.destroy
      flash[:success] = t "user.delete_success"
      redirect_to :back
    else
      flash.now[:danger] = t "user.delete_error"
      render :index
    end
  end

  private
  def ajax_respond
    @action = params[:action]
    respond_to do |format|
      format.html {redirect_to admin_users_path(from: @action, id: @user.id)}
      format.js
    end
  end

  def user_params
    params.require(:user).permit :name, :email, :password,
      :password_confirmation, :role
  end

  def load_all_users
    @users = User.page params[:page]
  end

  def load_user
    @user = params[:id].nil? ? User.new : User.find_by(id: params[:id])
  end

  def load_roles
    @roles = User.roles
  end
end
