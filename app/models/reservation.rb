class Reservation < ApplicationRecord
  belongs_to :user
  attr_accessor :date, :start_time, :end_time
  validate :start_at_should_be_before_end_at
  validates :start_at, reservation_period: true

  def start_at_should_be_before_end_at
    errors.add(:base, "開始時刻は終了時刻より前にしてください。") if start_at >= end_at
  end
end
