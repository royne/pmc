class StudentsController < ApplicationController
  def index
    @students = Student.all
    @array_students_user = []
    @current_date = Time.now.strftime("%y%m%d")

    q = "%#{params[:keyword]}%"
    @students = @students.where("name LIKE ? OR last_name LIKE ? OR course LIKE ?", q, q, q)

    @user_students = User.find(current_user.id)
  end

  def new
    @student = Student.new
  end

  def create
    @student = current_user.students.create(students_params)
    if @student.save
      redirect_to students_path, notice:"el estudiante se creo con exito"
    else
      flash[:alert] = @student.errors.full_messages
      render :new
    end
  end

  def show
    @student = Student.find(params[:id])
    @payments = Payment.all.order(created_at: :desc)
    @current_date = Time.now.strftime("%y%m%d")
  end

  private
    def students_params
      params.require(:student).permit(:name, :last_name, :cellphone, :age, :address, :course, :legal_guardian, :phone_lg, :eps)
    end
end
