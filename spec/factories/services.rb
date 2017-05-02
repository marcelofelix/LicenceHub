# frozen_string_literal: true
FactoryGirl.define do
  sequence :service do |n|
    "Service #{n}"
  end

  factory :service do
    name { generate(:service) }
    periodicity :monthly
    company
  end
end
