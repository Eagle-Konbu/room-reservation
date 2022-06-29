class Reservation < ApplicationRecord
  belongs_to :user
  attr_accessor :date, :start_time, :end_time
  validate :start_at_should_be_before_end_at

  def start_at_should_be_before_end_at
    errors.add(:start_at, "can't be after end at") if start_at >= end_at
  end
end
