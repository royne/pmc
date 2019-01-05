class CoursesController < ApplicationController
  def new
    @course = Course.new
  end

  def create
    @course = current_user.courses.create(courses_params)
    if @course.save
      redirect_to students_path, notice:"el curso se creo con exito"
    else
      flash[:alert] = @course.errors.full_messages
      render :new
    end
  end

  private
    def courses_params
      params.require(:course).permit(:name)
    end
end
