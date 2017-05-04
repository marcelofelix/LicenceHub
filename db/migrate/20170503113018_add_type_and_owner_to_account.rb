class AddTypeAndOwnerToAccount < ActiveRecord::Migration[5.0]
  def change
    add_column :accounts, :parent_id, :integer, index: true
    add_foreign_key :accounts, :accounts, column: :parent_id
  end
end
