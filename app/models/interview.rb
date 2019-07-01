class Interview < ApplicationRecord
  validates :description, presence: true
  validates :interviewee, presence: true
  validates :interviewers, presence: true
  validates :methods, presence: true

  belongs_to :event
end
