class Interview < ApplicationRecord
  validates_presence_of :description, :interviewee, :interviewers, :methods

  belongs_to :event
end
