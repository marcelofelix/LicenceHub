# frozen_string_literal: true
#
# Service is type of work that a Company can
# provide to their Customer and charge them.
class Service < ApplicationRecord
  belongs_to :company
end
