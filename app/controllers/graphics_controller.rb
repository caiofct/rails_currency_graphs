class GraphicsController < ApplicationController

  respond_to :html, only: [:index]
  respond_to :js, only: [:bitcoin]

  def index
  end

  def chart
    charts = %w(bitcoin nasdaq etherium)
    @series = []
    charts.each do |chart|
      @series << { name: chart.to_s, data: data_for_chart(chart) }
    end
  end

  private

  def data_for_chart(chart_type)
    end_date = Date.today.end_of_month - 1.month
    start_date = end_date - 29.month

    case chart_type
    when "bitcoin"
      return Quandl::Dataset.get('BCHARTS/BITKONANUSD').data(params: { limit: 30, collapse: 'monthly', start_date: start_date.to_s, end_date: end_date.to_s }).values.map{|b| [b.date.to_s, b.open] }
    when "etherium"
      return get_etherium_historical_data(start_date)
    when "nasdaq"
      return Quandl::Dataset.get('WFE/INDEXES_NASDAQUSCOMPOSITE').data(params: { limit: 30, collapse: 'monthly', start_date: start_date.to_s, end_date: end_date.to_s }).values.map{|b| [b.date.to_s, b.value] }
    end
  end

  def get_etherium_historical_data(start_date)
    result = []
    30.times.each do |index|
      timestamp = start_date + (index).month
      response = HTTParty.get("https://min-api.cryptocompare.com/data/pricehistorical?fsym=ETH&tsyms=USD&ts=#{timestamp.to_time.to_i}&extraParams=rails_currency_graph")
      if response.success?
        result << [timestamp.to_s, JSON.parse(response.body)['ETH']["USD"]]
      else
        result << [timestamp.to_s, 0]
      end
    end
    result
  end
end
