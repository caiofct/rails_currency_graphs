require 'rails_helper'

RSpec.describe Currency do
  it "initializes properly" do
    nasdaq = FactoryGirl.build(:nasdaq)
    expect(nasdaq.end_date).not_to be_nil
    expect(nasdaq.data_amount).not_to be_nil
    expect(nasdaq.start_date).not_to be_nil
  end

  it "returns some data" do
    nasdaq = FactoryGirl.build(:nasdaq)
    expect(nasdaq.get_data.length).to eq 1
  end
end
