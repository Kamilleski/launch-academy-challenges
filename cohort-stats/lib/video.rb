class Video < Lesson
  attr_accessor :name, :body
  attr_reader :url

  def initialize(name, body, url)
    @name = name
    @body = body
    @url = url
  end
end
