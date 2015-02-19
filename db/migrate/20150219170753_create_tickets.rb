class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.references :user, index: true
      t.references :event, index: true, null: false
      t.string :comment

      t.timestamps null: false
    end
    add_foreign_key :tickets, [:users_id, :event_id], unique: true
    add_foreign_key :tickets, [:event_id, :users_id], unique: true
  end
end
