# frozen_string_literal: true
#
# Account is the central piece that connect Company
# Users and Services. An Account should be used to
# configure the type of Services a Company provide
# and how they work
#
# An Account can be one of three types
#
# :manager - Are accounts that manage the App
# :provider - Are account that provide services to anothers accounts
# :client - Are account that ask for services to another account

# And account can alson have a parent account, an account :client should
# have a account provider as parent and one accont :provider should have a
# accont :manager as parent.

# One accont parent is for who you will pay for some service
# :client pay to :provider by services that a :provider provide
# :provider pay to :manager to use the App
class Account < ApplicationRecord
  validates :name, length: { minimum: 3, maximum: 100 }
  has_many :accounts
  belongs_to :parent, optional: true, foreign_key: :parent_id, class_name: Account

  def add_account(**_opts)
    throw :not_implemented
  end
end
