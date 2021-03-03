class SessionsController < ApplicationController
  before_action :require_current_user, only: %i[impersonate destroy]
  before_action :require_no_current_user, only: :create

  def create
    self.current_user = User.find(params[:user_id])
  end

  def impersonate
    self.current_user = User.find(params[:user_id])
  end

  def destroy
    cookies.clear
    redirect_to root_path
  end
end
