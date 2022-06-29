class ChangeStartAtAndEndAtColumnOnReservations < ActiveRecord::Migration[7.0]
  def change
    change_column_null :reservations, :start_at, false
    change_column_null :reservations, :end_at, false
  end
end
