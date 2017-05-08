# frozen_string_literal: true
#
# Service is type of work that a Company can
# provide to their Customer and charge them.
class Service < ApplicationRecord
  validates :name, length: { minimum: 3, maximum: 100 }
  validates :periodicity, presence: true
end
