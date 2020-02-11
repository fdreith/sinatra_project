class CreateUserHouseholds < ActiveRecord::Migration
  def change
    create_table :user_households do |t|
      t.integer :user_id
      t.integer :household_id

      t.timestamps null: false
    end
  end
end
