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

  private
    def payments_params
      params.require(:payment).permit(:month, :start_date, :end_date, :price, :detail, :student_id)
    end
end
