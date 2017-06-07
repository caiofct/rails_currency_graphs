FactoryGirl.define do
  factory :etherium do
    initialize_with do
      new(Date.today.end_of_month - 2.month, 1)
    end
  end
end
