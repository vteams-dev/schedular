class CreateCalendars < ActiveRecord::Migration[6.0]
  def change
    create_table :calendars do |t|
      t.string :title
      t.integer :owner_id
      t.string :owner_type

      t.timestamps
    end
    add_index :Calendars, [:owner_type, :owner_id]
  end
end
