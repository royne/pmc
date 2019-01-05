class ExpirationsController < ApplicationController
  def index
    @students = current_user.students.includes(:payments, :courses).order(created_at: :asc)
    @array_students_user = []

    @current_date = Time.now.strftime("%y%m%d")
    expiration_date = Time.now.strftime("%y%m%d").to_i + 5
    @expiration_date = expiration_date.to_s
  end
end
