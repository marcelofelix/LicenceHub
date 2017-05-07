# frozen_string_literal: true
#
# Basic application helper
module AccountHelper
  def select_accounts(value = nil)
    values = account_options(value)
    select_tag(:account_id, values, prompt: 'Selecione um', onchange: 'this.form.submit();')
  end

  def account_options(value = nil)
    accounts = current_user.account.accounts
    options_from_collection_for_select(accounts, 'id', 'name', value)
  end
end
