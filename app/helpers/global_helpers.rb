require 'rubygems'
require 'redcloth'

module Merb
  module GlobalHelpers
    def textile(text)
      RedCloth.new(text).to_html
    end
    def log_permalink(log)
      "log-#{log.id}-#{log.created_at.strftime("%m-%d-%Y")}"
    end
    def time_of_day(date)
      "#{relative_date(date)}::#{date.strftime("%I:%M %p")}"
    end
    def past_logs
      Log.find_past
    end
  end
end
