class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :pet_id
      t.string :event_type
      t.string :details

      t.timestamps null: false
    end
  end
end
