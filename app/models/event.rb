class Event < ApplicationRecord
  validates :title,:event_type,:start,:end,:repeat,:repeat_type,:repeat_value_i,:repeat_value_s,:location,presence: true

  belongs_to :calender
  has_one :interview

end
