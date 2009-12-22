class Time
  def at_midnight
    Time.mktime(self.year, self.month, self.day, 0, 0, 0)
  end
end

