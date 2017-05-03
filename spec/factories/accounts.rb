# frozen_string_literal: true
#
FactoryGirl.define do
  sequence :account do |n|
    "Account #{n}"
  end

  factory :account do
    name { generate(:account) }
  end
end
