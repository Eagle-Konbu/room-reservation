class Reservation < ApplicationRecord
  belongs_to :user
  attr_accessor :date, :start_time, :end_time
end
