# frozen_string_literal: true
FactoryGirl.define do
  sequence :email do |n|
    n
  end

  factory :user do
    name 'Marcelo'
    association :account, factory: :provider
    password '123456'
    email { "#{name.downcase}@#{account.name}-#{generate(:email)}.com" }
  end

  factory :client_user, class: User do
    name 'Marcelo'
    association :account, factory: :client
    password '123456'
    email { "#{name.downcase}@#{account.name}-#{generate(:email)}.com" }
  end

  factory :provider_user, class: User do
    name 'Marcelo'
    association :account, factory: :provider
    password '123456'
    email { "#{name.downcase}@#{account.name}-#{generate(:email)}.com" }
  end
end
