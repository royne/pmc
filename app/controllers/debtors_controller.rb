class DebtorsController < ApplicationController
  def index
    @students = Student.all.order(created_at: :desc)
    @array_students_user = []
    @current_date = Time.now.strftime("%y%m%d")

    q = "%#{params[:q_s]}%"
    @students = @students.where("name LIKE ? OR last_name LIKE ?", q, q)

  end

end
