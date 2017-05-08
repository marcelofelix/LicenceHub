# frozen_string_literal: true
FactoryGirl.define do
  sequence :unity do |n|
    n
  end

  factory :unity do
    name { "Unity #{generate(:unity)} of #{client.name}" }
    client
  end
end
