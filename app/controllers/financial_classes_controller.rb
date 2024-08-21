class FinancialClassesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_financial_class, only: %i[ show edit update destroy ]

  # GET /financial_classes or /financial_classes.json
  def index
    @financial_classes = FinancialClass.where(user_id: current_user.id)
  end

  # GET /financial_classes/1 or /financial_classes/1.json
  def show
  end

  # GET /financial_classes/new
  def new
    @financial_class = FinancialClass.new
  end

  # GET /financial_classes/1/edit
  def edit
  end

  # POST /financial_classes or /financial_classes.json
  def create
    @financial_class = current_user.financial_classes.build(financial_class_params) # Associa o guest ao usuário logado

    respond_to do |format|
      if @financial_class.save
        format.html { redirect_to financial_class_url(@financial_class), notice: "Financial class was successfully created." }
        format.json { render :show, status: :created, location: @financial_class }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @financial_class.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /financial_classes/1 or /financial_classes/1.json
  def update
    respond_to do |format|
      if @financial_class.update(financial_class_params)
        format.html { redirect_to financial_class_url(@financial_class), notice: "Financial class was successfully updated." }
        format.json { render :show, status: :ok, location: @financial_class }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @financial_class.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /financial_classes/1 or /financial_classes/1.json
  def destroy
    @financial_class.destroy!

    respond_to do |format|
      format.html { redirect_to financial_classes_url, notice: "Financial class was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_financial_class
      @financial_class = FinancialClass.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def financial_class_params
      params.require(:financial_class).permit(:name, :abbreviation, :is_revenue)
    end
end
