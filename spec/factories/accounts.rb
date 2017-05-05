# frozen_string_literal: true
#
FactoryGirl.define do
  sequence :account do |n|
    n
  end

  factory :manager do
    name { "Manager #{generate(:account)}" }
  end

  factory :provider do
    name { "Provider #{generate(:account)}" }
  end

  factory :client do
    name { "Client #{generate(:account)}" }
  end
end
