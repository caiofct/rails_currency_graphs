require 'rails_helper'

RSpec.describe Bitcoin do
  it "initializes properly" do
    bitcoin = FactoryGirl.build(:bitcoin)
    expect(bitcoin.end_date).not_to be_nil
    expect(bitcoin.data_amount).not_to be_nil
    expect(bitcoin.start_date).not_to be_nil
  end

  it "returns some data" do
    bitcoin = FactoryGirl.build(:bitcoin)
    expect(bitcoin.get_data.length).to eq 1
  end
end
