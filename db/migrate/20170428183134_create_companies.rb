class CreateCompanies < ActiveRecord::Migration[5.0]
  def change
    create_table :companies do |t|
      t.string :name, null: false
      t.belongs_to :account, foreign_key: true, index: true, null: false
      t.timestamps
    end
  end
end
