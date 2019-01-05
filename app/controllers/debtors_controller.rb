class DebtorsController < ApplicationController
  def index
    @students =  current_user.students.includes(:payments).where(state:true).order(created_at: :desc)
    @current_date = Time.now.strftime("%y%m%d")

    q = "%#{params[:concept]}%"
    @students = @students.where("name LIKE ? OR last_name LIKE ?", q, q)

    if params[:course_id].present?
      @students =current_user.students.joins(:courses).where("course_id = ?", params[:course_id])
    end
  end

end
