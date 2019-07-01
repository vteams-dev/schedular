class Event < ApplicationRecord
  belongs_to :calender
  has_one :interview
end
