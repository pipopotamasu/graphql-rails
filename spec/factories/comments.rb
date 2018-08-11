FactoryBot.define do
  factory :comment do
    sequence(:content) { |n| "comment_content#{n}"}
    post
  end
end