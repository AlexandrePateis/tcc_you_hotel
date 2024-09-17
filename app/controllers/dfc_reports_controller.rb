class DfcReportsController < ApplicationController
  def index
    # Filtros para as datas de entrada (entry_date)
    @start_date = params[:start_date] || Date.today.beginning_of_month
    @end_date = params[:end_date] || Date.today.end_of_month

    @payments = Payment.where(user_id: current_user.id).where(entry_date: @start_date..@end_date)
    
    # Aplicar filtros adicionais se necessário
    if params[:hotel_id].present?
      if params[:hotel_id] == 'no_hotel'
        @payments = @payments.where(hotel_id: nil)
      else
        @payments = @payments.where(hotel_id: params[:hotel_id])
      end
    end

    if params[:financial_class_id].present?
      @payments = @payments.where(financial_class_id: params[:financial_class_id])
    end

    if params[:transaction_type].present?
      if params[:transaction_type] == 'income'
        @payments = @payments.joins(:financial_class).where(financial_classes: { is_revenue: true })
      elsif params[:transaction_type] == 'expense'
        @payments = @payments.joins(:financial_class).where(financial_classes: { is_revenue: false })
      end
    end

    # Cálculo dos totais de receitas e despesas
    @total_income = @payments.joins(:financial_class).where(financial_classes: { is_revenue: true }).sum(:price)
    @total_expense = @payments.joins(:financial_class).where(financial_classes: { is_revenue: false }).sum(:price)
    @net_cash_flow = @total_income - @total_expense
  end
end
