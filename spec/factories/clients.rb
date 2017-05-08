# frozen_string_literal: true
#
FactoryGirl.define do
  sequence :client do |n|
    n
  end

  factory :client do
    name { "Manager #{generate(:client)}" }
  end
end
