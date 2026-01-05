module FlightHelper
  def format_to_date(start_time)
    start_time.to_date.strftime("%a, %d %b %Y")
  end

  def format_to_time(start_time)
    start_time.strftime("%H:%M %Z(%z)")
  end
end
