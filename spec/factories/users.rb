# frozen_string_literal: true
FactoryGirl.define do
  factory :user do
    name 'Marcelo'
    account
    password '123456'
    email { "#{name.downcase}@#{account.name}.com" }
  end
end
