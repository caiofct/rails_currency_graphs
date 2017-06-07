class Currency
  BITCOIN = 'bitcoin'
  ETHEREUM = 'ethereum'
  NASDAQ = 'nasdaq'

  # The initial date to search the data from the webservice
  attr_accessor :start_date
  # The final date to search the data from the webservice
  attr_accessor :end_date
  # Amount of data to limit the webservice query
  attr_accessor :data_amount
  # Constructor to initialize the end_date and amount and calculate the start date
  def initialize(end_date, data_amount)
    @end_date = end_date
    @data_amount = data_amount
    calculate_start_date
  end

  # Gets the data from the webservice based on the start_date, end_date and data_amount
  def get_data(currency_type)
    # Will be overriden on Currency subclasses
  end

  # Gets the data from a specific currency type
  def self.data_by_type(currency_type, end_date, data_amount)
    case currency_type
    when Currency::BITCOIN
      return Bitcoin.new(end_date, data_amount).get_data
    when Currency::ETHEREUM
      return Ethereum.new(end_date, data_amount).get_data
    when Currency::NASDAQ
      return Nasdaq.new(end_date, data_amount).get_data
    end
  end

  private
  # Calculates the start date as being the (end_date - data_amount-1 months)
  # Ex: end_date: 2017-06-30 and data_amount: 2 => start_date: 2017-05-30
  #
  def calculate_start_date
    if !@end_date.blank? && @data_amount > 0
      @start_date = @end_date - (@data_amount-1).month
      @start_date.end_of_month
    end
  end
end
