# frozen_string_literal: true
#
FactoryGirl.define do
  sequence :client do |n|
    n
  end

  factory :client do
    name { "Client #{generate(:client)}" }
  end

  factory :provider, class: Client do
    name { "Provider #{generate(:client)}" }
    provider true
  end
end
