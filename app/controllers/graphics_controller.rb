class GraphicsController < ApplicationController

  respond_to :html, only: [:index]
  respond_to :js, only: [:bitcoin]

  def index
  end

  def chart
    # Types of charts
    chart_types = [Currency::BITCOIN, Currency::ETHERIUM, Currency::NASDAQ]
    # Series to display in the chart
    @series = []
    # Amount of points of data to get and generate in the chart
    data_amount = 30
    # The final data to get the data from (Using 2 months before the current month because the nasdaq api only has data from this period)
    end_date = Date.today.end_of_month - 2.month
    # Iterating on each chart type
    chart_types.each do |chart_type|
      @series << { name: chart_type.to_s, data: Currency.data_by_type(chart_type, end_date, data_amount) }
    end
  end
end
