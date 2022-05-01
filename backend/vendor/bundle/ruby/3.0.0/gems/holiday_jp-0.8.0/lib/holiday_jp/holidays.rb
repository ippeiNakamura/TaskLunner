require "yaml"

module HolidayJp
  class Holidays
    attr_accessor :holidays

    def initialize
      @holidays = {}
      yaml = YAML.load_file(File.expand_path("../../../holidays.yml", __FILE__))
      yaml.map do |key, value|
        @holidays[key] = Holiday.new(key, value)
      end
    end

    def between(start, last)
      holidays.find_all do |date, _holiday|
        start.to_date <= date && date <= last.to_date
      end.map(&:last)
    end

    def holiday?(date)
      holidays.has_key?(date.to_date)
    end
  end
end
