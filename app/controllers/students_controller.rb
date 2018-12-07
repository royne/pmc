class StudentsController < ApplicationController
  def index
    @students = current_user.students.includes(:payments).order(state: :desc)
    @current_date = Time.now.strftime("%y%m%d")

    q = "%#{params[:keyword]}%"
    @students = @students.where("name LIKE ? OR last_name LIKE ? OR course LIKE ?", q, q, q)

    @user_students = User.find(current_user.id)
    @payMonth = @user_students.students.joins(:payments).group(:month).sum(:price)
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

    @sum = 0
    @payments.each do |payment|
     if payment.student_id == @student.id
       @sum = @sum + payment.price
     end
    end
  end

  def edit
    @student = Student.find(params[:id])
  end

  def update
    @student = Student.update(params[:id], students_params)
  end

  # descarga de xls
  def xls_students
    @query = User.find(current_user.id).students.includes(:payments)
    respond_to do |format|
      format.html
      format.xlsx{
        response.headers['Content-Disposition'] = 'attachment; filename="Estudiantes.xlsx"'
      }
    end
  end

  private
    def students_params
      params.require(:student).permit(:name, :last_name, :cellphone, :age, :address, :course, :legal_guardian, :phone_lg, :eps, :email, :state)
    end
end
