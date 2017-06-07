require 'rails_helper'

RSpec.describe Etherium do
  it "initializes properly" do
    etherium = FactoryGirl.build(:etherium)
    expect(etherium.end_date).not_to be_nil
    expect(etherium.data_amount).not_to be_nil
    expect(etherium.start_date).not_to be_nil
  end

  it "returns some data" do
    etherium = FactoryGirl.build(:etherium)
    expect(etherium.get_data.length).to eq 1
  end
end
