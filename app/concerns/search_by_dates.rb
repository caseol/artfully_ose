module SearchByDates
  attr_reader :start, :stop
  attr_reader :organization

  def start_with(start)
    start.present? ? DateTime.parse(start) : default_start
  end

  def stop_with(stop)
    stop.present? ? Sundial.midnightish(@organization, stop) : default_stop
  end

  def default_start
    DateTime.now.in_time_zone(@organization.time_zone).beginning_of_month
  end

  def default_stop
    DateTime.now.in_time_zone(@organization.time_zone).end_of_day
  end
end