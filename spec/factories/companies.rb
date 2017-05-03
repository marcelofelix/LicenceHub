# frozen_string_literal: true
FactoryGirl.define do
  sequence :company do |n|
    "Account #{n}"
  end

  factory :company do
    name { generate(:company) }
    account
  end
end
