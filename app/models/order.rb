# frozen_string_literal: true
#
class Order < ApplicationRecord
  belongs_to :service
  belongs_to :unity
end
