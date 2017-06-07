require 'rails_helper'

RSpec.describe Ethereum do
  it "initializes properly" do
    ethereum = FactoryGirl.build(:ethereum)
    expect(ethereum.end_date).not_to be_nil
    expect(ethereum.data_amount).not_to be_nil
    expect(ethereum.start_date).not_to be_nil
  end

  it "returns some data" do
    ethereum = FactoryGirl.build(:ethereum)
    expect(ethereum.get_data.length).to eq 1
  end
end
