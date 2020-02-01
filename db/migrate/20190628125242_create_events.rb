class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :title
      t.datetime :start_time
      t.datetime :end_time
      t.boolean :repeat
      t.string :repeat_type
      t.string :repeat_value
      t.string :location
      t.string :color
      t.references  :calendar, foreign_key: true
      t.references  :user, foreign_key: true
      t.references  :eventable, polymorphic: true, index: true

      t.timestamps
    end
  end
end
