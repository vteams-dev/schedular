class Event < ApplicationRecord
  validates_presence_of :title, :start_time, :end_time


  belongs_to :calendar
  belongs_to :user
  belongs_to :eventable, polymorphic: true, optional: true
end
