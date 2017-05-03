# frozen_string_literal: true
#
# Account is the central piece that connect Company
# Users and Services. An Account should be used to
# configure the type of Services a Company provide
# and how they work
#
class Account < ApplicationRecord
  validates :name, length: { minimum: 3, maximum: 100 }
end
