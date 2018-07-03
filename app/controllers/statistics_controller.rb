class StatisticsController < ApplicationController
  def index
    @user_students = User.find(current_user.id)
    @current_date = Time.now.strftime("%y%m%d")

    students_debtors = Array.new
    @user_students.students.each do |student|
      if student.payments.last.end_date.strftime("%y%m%d") < @current_date
        students_debtors.push(student)
      end
    end
    @students_debtors = students_debtors

  end
end
