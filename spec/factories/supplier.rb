FactoryGirl.define do
  factory :supplier do
    sequence(:name){|n| "Supplier#{n}"}
    sequence(:url){|n| "http://sp#{n}.example.com"}
  end
end
