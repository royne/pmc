class StateController < ApplicationController
  def index
    @students = User.find(current_user.id).students.includes(:courses)
  end
end
