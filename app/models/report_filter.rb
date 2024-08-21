# app/models/report_filter.rb
class ReportFilter
  include ActiveModel::Model

  attr_accessor :start_date, :end_date, :hotel_id, :financial_class_id, :transaction_type

  # Validações, se necessário
  validates :start_date, :end_date, presence: true

  def initialize(attributes = {})
    super
    @start_date ||= Date.today.beginning_of_month
    @end_date ||= Date.today.end_of_month
  end
end
