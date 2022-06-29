class ReservationPeriodValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    other_reservations = Reservation.where('start_at < ? AND end_at > ?', record.end_at, record.start_at)
    record.errors.add(:base, "予約期間が重複しています。") if other_reservations.exists?
  end
end