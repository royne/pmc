class StudentsController < ApplicationController
  def index
    if current_user.sign_in_count > 2 && current_user.phone == nil
      render 'update_user_new'
    end
    
    @students = current_user.students.includes(:payments, :courses).order(state: :desc)
    @current_date = Time.now.strftime("%y%m%d")

    if params[:keyword].present?
      q = "%#{params[:keyword]}%"
      @students = @students.where("name LIKE ? OR last_name LIKE ?", q, q)
    end

    if params[:course_id].present?
      @students =current_user.students.joins(:courses).where("course_id = ?", params[:course_id])
    end

    @user_students = User.find(current_user.id)
    @payMonth = @user_students.students.joins(:payments).group(:month).sum(:price)
    @courses = current_user.courses.joins(:students).group(:name).count
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

    @sum = @student.payments.sum(:price)
    @course = @student.courses
  end

  def edit
    @student = Student.find(params[:id])
  end

  def update
    @student = Student.update(params[:id], students_params)
    if @student.update(students_params)
      redirect_to student_path, notice: "El estudiante se actualizo con exito"
    end
  end

  # descarga de xls
  def xls_students
    @query = User.find(current_user.id).students.includes(:payments)
    @payMonth = User.find(current_user.id).students.joins(:payments).group(:month).sum(:price)
    respond_to do |format|
      format.html
      format.xlsx{
        response.headers['Content-Disposition'] = 'attachment; filename="Estudiantes.xlsx"'
      }
    end
  end

  # actualiza los datos del usuario
  def updateUserNew
    user = current_user
    name = params[:name]
    phone = params[:phone]
    address = params[:address]
    user.update(name: name, phone: phone, address: address)
    redirect_to students_path
  end

  private
    def students_params
      params.require(:student).permit(:name, :last_name, :cellphone, :age, :address, :legal_guardian, :phone_lg, :eps, :email, :state, :course_ids => [])
    end
end
