# frozen_string_literal: true
FactoryGirl.define do
  factory :user do
    name 'Marcelo'
    company
    password '123456'
    email { "#{name.downcase}@#{company.name}.com" }
  end
end
