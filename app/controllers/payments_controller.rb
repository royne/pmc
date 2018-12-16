class PaymentsController < ApplicationController
  def index
    @payments = Payment.all
  end

  def new
    # byebug
    @payment = Payment.new
    @student = params[:student_id]
  end

  def create
    @payment = Payment.create(payments_params)
    unless @payment.save
      flash[:alert] = @payment.errors.full_messages
      render :new
    end
  end

  def edit
    @payment = Payment.find(params[:id])
  end

  def update
    student = params[:id]
    @payment = Payment.update(params[:id], payments_params)
    if @payment.update(payments_params)
      redirect_to student_path(@payment.student_id), notice: "El pago se actualizo con exito"
    end
  end

  def destroy
    payment = Payment.find(params[:id])
    payment.destroy
    redirect_to student_path(payment.student_id), notice: "El pago fue eliminado con exito"
  end

  private
    def payments_params
      params.require(:payment).permit(:month, :start_date, :end_date, :price, :detail, :student_id)
    end
end
