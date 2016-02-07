class Theater

  def initialize(number_of_seats, seats_sold = 0)
    @number_of_seats = number_of_seats
    @seats_sold = seats_sold
  end

  def admit!(tickets = 1)
    if @seats_sold + tickets > @number_of_seats
      puts "Sorry, we're out of space."
    else
      @seats_sold += tickets
    end
  end

  def at_capacity?
    @seats_sold = @number_of_seats
  end

  def record_walk_outs!(walkouts = 1)
    @seats_sold -= walkouts
  end
end
