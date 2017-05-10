# frozen_string_literal: true
#
# Services helper methods
module ServicesHelper
  def service_options(value = nil)
    options_from_collection_for_select(Service.all, 'id', 'name', value)
  end
end
