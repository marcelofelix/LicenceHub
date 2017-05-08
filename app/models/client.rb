# frozen_string_literal: true
#
# Client is who ask for Services that should be done by
# their Unities
class Client < ApplicationRecord
  validates :name, length: { minimum: 3, maximum: 100 }
end
