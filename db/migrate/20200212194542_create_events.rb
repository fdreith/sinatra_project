class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :pet_id
      t.string :event_type
      t.datetime :time_of_event

      t.timestamps null: false
    end
  end
end
