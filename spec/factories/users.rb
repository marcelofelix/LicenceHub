# frozen_string_literal: true
FactoryGirl.define do
  sequence :email do |n|
    n
  end

  factory :user do
    name 'Marcelo'
    client
    password '123456'
    email { "#{name.downcase}@#{client.name}-#{generate(:email)}.com" }
  end
end
