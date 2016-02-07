require 'time'
require 'csv'

# CSV.foreach("showtime_data.csv") do |row|
#   puts row.inspect
# end

# csv = CSV.new('showtime_data.csv', :headers => true, :header_converters => :symbol, :converters => :all)
# csv.to_a.map {|row| row.to_hash }

class Movies

  def initialize(title, genre, time)
    @title = title
    @genre = genre
    @time = Time.parse(time)
  end

  def self.read_from_listing(file)
    movies = []
    CSV.foreach(file, headers: true) do |row|
      movies << new(row["title"], row["genre"], row["time"])
    end
    movies
  end

  def showing_after?(arrival_time_string)
    @time >= Time.parse(arrival_time_string)
  end

  def showing_between?(early_time, later_time)
    @time >= Time.parse(early_time) && @time <= Time.parse(later_time)
  end

  def comedy?
    @genre == 'Comedy'
  end

end



now = Time.parse("7:00PM")

current_times = Movies.read_from_listing('showtime_data.csv')

require 'pry'
binding.pry
