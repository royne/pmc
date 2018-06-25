class ExpirationsController < ApplicationController
  def index
    @students = Student.all.order(created_at: :asc)
    @array_students_user = []

    @current_date = Time.now.strftime("%y%m%d")
    expiration_date = Time.now.strftime("%y%m%d").to_i + 5
    @expiration_date = expiration_date.to_s
  end
end
