class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :dev_unique_id
      t.integer :days_completed
      t.datetime :serv_time_creaton
      t.string :device_push_id
      t.string :name

      t.timestamps null: false
    end
  end
end
