FactoryGirl.define do
  factory :currency do
    initialize_with do
      new(Date.today.end_of_month - 2.month, 30)
    end
  end
end
