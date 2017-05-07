# frozen_string_literal: true
FactoryGirl.define do
  sequence :unity do |n|
    "Account #{n}"
  end

  factory :unity do
    name { "Unity #{generate(:unity)}" }
    association :account, factory: :client
  end
end
