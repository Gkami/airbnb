class Interval < ActiveRecord::Base

  validates_presence_of :start_date, :end_date

  # Check if a given interval overlaps this interval    
  def overlaps?(other)
    (start_date - other.end_date) * (other.start_date - end_date) >= 0
  end

  # Return a scope for all interval overlapping the given interval, including the given interval itself
  named_scope :overlapping, lambda { |interval| {
    :conditions => ["id <> ? AND (DATEDIFF(start_date, ?) * DATEDIFF(?, end_date)) >= 0", interval.id, interval.end_date, interval.start_date]
  }}

end
