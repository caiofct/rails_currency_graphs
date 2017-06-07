require 'rails_helper'

RSpec.describe Currency do
  it "initializes properly" do
    currency = FactoryGirl.build(:currency)
    expect(currency.end_date).not_to be_nil
    expect(currency.data_amount).not_to be_nil
    expect(currency.start_date).not_to be_nil
  end

  it "calculates the start_date properly" do
    currency = FactoryGirl.build(:currency)
    # Calculating the difference in months between the start and end date.
    months_delta = (currency.end_date.year * 12 + currency.end_date.month) - (currency.start_date.year * 12 + currency.start_date.month)
    # The difference in months + 1 must be equal the data_amount
    expect(months_delta + 1).to eq currency.data_amount
  end

  it "returns some data for each chart type" do
    chart_types = [Currency::BITCOIN, Currency::ETHERIUM, Currency::NASDAQ]
    # Amount of points of data to get and generate in the chart
    data_amount = 1
    # The final data to get the data from (Using 2 months before the current month because the nasdaq api only has data from this period)
    end_date = Date.today.end_of_month - 2.month
    # Iterating on each chart type
    chart_types.each do |chart_type|
      expect(Currency.data_by_type(chart_type, end_date, data_amount).length).to eq 1
    end
  end
end
