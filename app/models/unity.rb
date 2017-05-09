# frozen_string_literal: true
#
# Company is who provide and who receive the Service
# A Company can use this App to provide services to another
# Company or to by they self.
#
class Unity < ApplicationRecord
  validates :name, length: { minimum: 3, maximum: 100 }
  belongs_to :client
  has_and_belongs_to_many :services
end
