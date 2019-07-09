class Event < ApplicationRecord
  validates_presence_of :title, :event_type, :start, :end, :repeat, :repeat_type, :repeat_value_i, :repeat_value_s, :location

  belongs_to :calendar
  has_one :interview

end
