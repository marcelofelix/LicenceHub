# frozen_string_literal: true
#
class Unity < ApplicationRecord
  validates :name, length: { minimum: 3, maximum: 100 }
  belongs_to :client
  has_many :orders
end
