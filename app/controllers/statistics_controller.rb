class StatisticsController < ApplicationController
  def index
    @user_students = User.find(current_user.id)
    @current_date = Time.now.strftime("%y%m%d")

    students_debtors = Array.new
    @user_students.students.includes(:payments).each do |student|
      if student.payments.last.end_date.strftime("%y%m%d") < @current_date
        students_debtors.push(student)
      end
    end
    @students_debtors = students_debtors

    # suma ingresos x Mes
    @sum_month = 0
    @user_students.students.includes(:payments).each do |student|
      student.payments.each do |payments|
        if payments.start_date.strftime("%m") == Time.now.strftime("%m")
          @sum_month = payments.price + @sum_month
        end
      end
    end

    state = Array.new
    @user_students.students.each do |e|
      e.state == false ? state.push(e) : ""
    end
    @state = state.count

  end
end
