class Person
  attr_reader :first_name, :middle_name, :last_name
  attr_accessor :full_name

  def initialize(first_name, middle_name = nil, last_name = nil)
    if last_name.nil?
      full_name = first_name.split(" ")
      if full_name.length == 3
          @middle_name = full_name[1]
      end
      @first_name = full_name.first
      @last_name = full_name.last
    else
      @first_name = first_name
      @last_name = last_name
    end
  end
end
