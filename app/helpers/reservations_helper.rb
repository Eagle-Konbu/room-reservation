module ReservationsHelper
  def times
    times = []
    (0..23).each do |hour|
      [0, 30].each do |minute|
        times << "#{format("%02d", hour)}:#{format("%02d", minute)}"
      end
    end
    times
  end
end
