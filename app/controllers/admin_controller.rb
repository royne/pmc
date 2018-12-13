class AdminController < ApplicationController
  before_action :authenticate_admin

  def index
    @users = User.includes(:students).with_role('user')
  end

  private
  def authenticate_admin
    redirect_to(students_path) unless current_user.has_role? :admin
  end
end
