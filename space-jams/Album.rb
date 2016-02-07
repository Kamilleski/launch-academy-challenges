class Album

  attr_reader :id, :title, :artists
  attr_accessor :summary, :duration, :tracks

  def initialize(id, title, artists)
    @id = id
    @title = title
    @artists = artists
    @tracks = []
  end

  def duration_min
    initial = 0
    @tracks.each do |song|
      initial += song[:duration_ms].to_f / 1000 / 60
    end
    initial.round(2)
  end

  def summary
    puts "Name: #{@title}"
    puts "Artist(s): #{@artists}"
    puts "Duration (min): #{duration_min}"
    puts "Tracks: "
    @tracks.each do |song|
      puts "- #{song[:title]}"
    end
    nil
  end
end
