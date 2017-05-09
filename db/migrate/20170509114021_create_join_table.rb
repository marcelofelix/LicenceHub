class CreateJoinTable < ActiveRecord::Migration[5.0]
  def change
    create_join_table :unities, :services do |t|
      t.index [:unity_id, :service_id]
      t.index [:service_id, :unity_id]
    end
  end
end
