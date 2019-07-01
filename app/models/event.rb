class Event < ApplicationRecord

  validates :title,presence: true
  validates :event_type, presence: true
  validates :start, presence: true
  validates :end,presence: true
  validates :repeat, presence: true
  validates :repeat_type, presence: true
  validates :repeat_value_i,presence: true
  validates :repeat_value_s, presence: true
  validates :location, presence: true


  belongs_to :calender
  has_one :interview

end