FactoryBot.define do
  factory :post do
    sequence(:title) { |n| "post_title#{n}"}
  end
end