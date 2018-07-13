class StateController < ApplicationController
  def index
    @user_students = User.find(current_user.id)
  end
end
