class Event < ApplicationRecord
  validates_presence_of :title, :start_time, :end_time, :color

  belongs_to :calendar
  belongs_to :user
  belongs_to :eventable, polymorphic: true, optional: true
  attr_accessor :date_range
end
