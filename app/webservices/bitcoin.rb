class Bitcoin < Currency
  def get_data
    return Quandl::Dataset.get('BCHARTS/BITKONANUSD').data(params: { limit: @data_amount,
                                                                     collapse: 'monthly',
                                                                     start_date: @start_date.to_s,
                                                                     end_date: @end_date.to_s }).values.map{|b| [b.date.to_s, b.open] }
  end
end
