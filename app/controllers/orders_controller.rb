class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_order, only: %i[ show edit update destroy ]

  # GET /orders or /orders.json
  def index
    @orders = Order.where(user_id: current_user.id)
  end

  # GET /orders/1 or /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders or /orders.json
  def create
    @order = current_user.orders.build(order_params) # Associa a ordem ao usuário logado
    
    if @order.save
      redirect_to new_payment_path(order_id: @order.id, financial_class_id: @order.financial_class_id, hotel_id: @order.hotel_id)
    else
      render :new
    end
  end
  

  # PATCH/PUT /orders/1 or /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to order_url(@order), notice: "Order was successfully updated." }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1 or /orders/1.json
  def destroy
    @order = Order.find(params[:id])

    if @order.destroy
      respond_to do |format|
        format.html { redirect_to orders_url, notice: "Order was successfully destroyed." }
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        format.html { redirect_to orders_url, alert: @order.errors.full_messages.join(', ') }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def order_params
      params.require(:order).permit(:hotel_id, :guest_id, :room_id, :check_in_date, :check_out_date, :financial_class_id)
    end
end
