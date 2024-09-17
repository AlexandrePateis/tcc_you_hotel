class PaymentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_payment, only: %i[ show edit update destroy ]

  # GET /payments or /payments.json
  def index
    @payments = Payment.where(user_id: current_user.id).page(params[:page]).per(10)
  
    if params[:entry_date].present?
      @payments = @payments.where('DATE(entry_date) = ?', params[:entry_date])
    end
  
    if params[:execution_date].present?
      @payments = @payments.where('DATE(execution_date) = ?', params[:execution_date])
    end
  
    if params[:type].present?
      @payments = @payments.joins(:financial_class).where(financial_classes: { is_revenue: params[:type] == 'revenue' })
    end
  end
  
  # GET /payments/1 or /payments/1.json
  def show
  end

  # GET /payments/new
  def new
    @payment = Payment.new
    @payment.user_id = current_user.id
    if params[:order_id].present?
      @payment.order_id = params[:order_id] 
      order = Order.find(params[:order_id])
      calculate_price(order)
    end
  end

  # GET /payments/1/edit
  def edit
  end

  # POST /payments or /payments.json
  def create
    @payment = current_user.payments.build(payment_params)
    if params[:payment][:order_id].present?
      order = Order.find(params[:payment][:order_id])
      @payment.financial_class_id = order.financial_class_id
      @payment.hotel_id = order.hotel_id
    end
    respond_to do |format|
      if @payment.save
        if @payment.order
          @payment.order.update!(payment_id: @payment.id)
        end
        format.html { redirect_to @payment, notice: 'Payment was successfully created.' }
        format.json { render :show, status: :created, location: @payment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @payment.errors, status: :unprocessable_entity }
      end
    end
  end
  
  

  # PATCH/PUT /payments/1 or /payments/1.json
  def update
    respond_to do |format|
      if @payment.update(payment_params)
        format.html { redirect_to payment_url(@payment), notice: "Payment was successfully updated." }
        format.json { render :show, status: :ok, location: @payment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /payments/1 or /payments/1.json
  def destroy
    @payment = Payment.find(params[:id])

    # Remover a referência ao pagamento na order antes de deletar
    @payment.order.update(payment_id: nil)

    @payment.destroy

    respond_to do |format|
      format.html { redirect_to payments_url, notice: 'Payment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def calculate_price(order)
    if order.check_in_date.present? && order.check_out_date.present?
      number_of_days = (order.check_out_date - order.check_in_date).to_i + 1
      @payment.price = order.room.price * number_of_days
    end
  end

  def set_payment
    @payment = Payment.find(params[:id])
  end

  def payment_params
    params.require(:payment).permit(:entry_date, :execution_date, :order_id, :price, :financial_class_id, :hotel_id)
  end
end
