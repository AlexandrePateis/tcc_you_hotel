class FinancialAccountsController < ApplicationController
  before_action :set_financial_account, only: %i[ show edit update destroy ]

  # GET /financial_accounts or /financial_accounts.json
  def index
    @financial_accounts = FinancialAccount.all
  end

  # GET /financial_accounts/1 or /financial_accounts/1.json
  def show
  end

  # GET /financial_accounts/new
  def new
    @financial_account = FinancialAccount.new
  end

  # GET /financial_accounts/1/edit
  def edit
  end

  # POST /financial_accounts or /financial_accounts.json
  def create
    @financial_account = FinancialAccount.new(financial_account_params)

    respond_to do |format|
      if @financial_account.save
        format.html { redirect_to financial_account_url(@financial_account), notice: "Financial account was successfully created." }
        format.json { render :show, status: :created, location: @financial_account }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @financial_account.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /financial_accounts/1 or /financial_accounts/1.json
  def update
    respond_to do |format|
      if @financial_account.update(financial_account_params)
        format.html { redirect_to financial_account_url(@financial_account), notice: "Financial account was successfully updated." }
        format.json { render :show, status: :ok, location: @financial_account }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @financial_account.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /financial_accounts/1 or /financial_accounts/1.json
  def destroy
    @financial_account.destroy!

    respond_to do |format|
      format.html { redirect_to financial_accounts_url, notice: "Financial account was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_financial_account
      @financial_account = FinancialAccount.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def financial_account_params
      params.require(:financial_account).permit(:bank, :account_name, :account_number, :agency, :description)
    end
end
