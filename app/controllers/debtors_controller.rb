class DebtorsController < ApplicationController
  def index
    @students =  current_user.students.includes(:payments).where(state:true).order(created_at: :desc)
    @current_date = Time.now.strftime("%y%m%d")

    q = "%#{params[:q_s]}%"
    @students = @students.where("name LIKE ? OR last_name LIKE ?", q, q)
  end

end
