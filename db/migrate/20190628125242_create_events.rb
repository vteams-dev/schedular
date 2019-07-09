class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :title
      t.string :event_type
      t.datetime :start
      t.datetime :end
      t.string :repeat
      t.string :repeat_type
      t.integer :repeat_value_i
      t.string :repeat_value_s
      t.string :location
      t.references  :calendar, foreign_key: true

      t.timestamps
    end

  end
end
