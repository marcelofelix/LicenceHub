# frozen_string_literal: true
#
# As Companies can provide services to each other
# the users of this Companies are who execute and who
# ask for Services
#
class User < ApplicationRecord
  validates :name, length: { minimum: 3, maximum: 100 }
  validates :email, length: { minimum: 3, maximum: 100 }
  validates :email, uniqueness: true
  has_secure_password
  belongs_to :account

  def logged?
    true
  end

  def self.by_account(account)
    User.where(account: account)
  end
end
