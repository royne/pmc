class StudentsController < ApplicationController
  def index
    @students = Student.all
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

  private
    def students_params
      params.require(:student).permit(:name, :last_name, :cellphone, :age, :address, :course, :legal_guardian, :phone_lg, :eps)
    end
end
