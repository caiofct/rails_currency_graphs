class Etherium < Currency
  def get_data
    result = []
    @data_amount.times.each do |index|
      timestamp = @start_date + (index).month
      timestamp = timestamp.end_of_month
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
