# app/controllers/dre_reports_controller.rb
class DreReportsController < ApplicationController
  
  def index
    @payments = Payment.where(user_id: current_user.id)
    @report_filter = ReportFilter.new(report_filter_params)
    @report_filter.start_date ||= Date.today.beginning_of_month
    @report_filter.end_date ||= Date.today.end_of_month
    @hotel_id = params[:hotel_id]

    if @hotel_id.present?
      if @hotel_id == 'no_hotel'
        @payments = @payments.where(hotel_id: nil)
      else
        @payments = @payments.where(hotel_id: @hotel_id )
      end
    end

    # Filtrar por classe financeira
    if params[:financial_class_id].present?
      @payments = @payments.where(financial_class_id: params[:financial_class_id])
    end

    # Filtrar por tipo (receita ou despesa)
    if params[:transaction_type].present?
      @payments = @payments.joins(:financial_class).where(financial_classes: { is_revenue: params[:transaction_type] == 'income' })
    end

    # Filtrar por data
    if params[:start_date].present? && params[:end_date].present?
      @payments = @payments.where(execution_date: params[:start_date]..params[:end_date])
    end

    # Calcular o valor final
    @total_revenue = @payments.joins(:financial_class).where(financial_classes: { is_revenue: true }).sum(:price)
    @total_expense = @payments.joins(:financial_class).where(financial_classes: { is_revenue: false }).sum(:price)
    @net_result = @total_revenue - @total_expense
  end


  private

  def report_filter_params
    params.fetch(:report_filter, {}).permit(:start_date, :end_date, :hotel_id, :financial_class_id, :transaction_type)
  end
end
