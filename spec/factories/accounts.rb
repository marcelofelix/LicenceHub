# frozen_string_literal: true
#
FactoryGirl.define do
  sequence :account do |n|
    "Account #{n}"
  end

  factory :account do
    name { generate(:account) }
    rule :client

    trait :provider do
      rule :provider
    end

    trait :manager do
      rule :manager
    end

    factory :account_provider, traits: [:provider]
    factory :account_manager, traits: [:manager]
  end
end
