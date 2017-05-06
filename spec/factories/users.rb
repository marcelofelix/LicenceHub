# frozen_string_literal: true
FactoryGirl.define do
  factory :user do
    name 'Marcelo'
    association :account, factory: :provider
    password '123456'
    email { "#{name.downcase}@#{account.name}.com" }
  end

  factory :client_user, class: User do
    name 'Marcelo'
    association :account, factory: :client
    password '123456'
    email { "#{name.downcase}@#{account.name}.com" }
  end
end
