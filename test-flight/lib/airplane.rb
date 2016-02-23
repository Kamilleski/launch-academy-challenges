class Airplane
  attr_accessor :type, :wing_loading, :horsepower, :running, :flying, :fuel, :fuel_needed
  attr_reader :message


  def initialize(type, wing_loading, horsepower, fuel = 100)
    @type = type
    @wing_loading = wing_loading
    @horsepower = horsepower
    @running = false
    @flying = false
    @fuel = fuel
  end

  def fuelCheck
    if @fuel - @fuel_needed < 0
      print "not enough fuel left to complete that action"
    else
      print @message
      @fuel -= @fuel_needed
    end
  end

  def start
    @fuel_needed = 10
    if @running == true
      @message = "airplane already started"
      fuelCheck
    else
      @message = "airplane started"
      @running = true
      fuelCheck
    end

  end

  def takeoff
    @fuel_needed = 50
    if @running == true
      @flying = true
      @message = "airplane launched"
      fuelCheck
    else
      print "airplane not started, please start"
    end
  end

  def land
    @fuel_needed = 30
    if @running == true && @flying == true
      @running = false
      @flying = false
      print "airplane landed"
    elsif @running == true && @flying == false
      print "airplane already on the ground"
    elsif @running == false
      print "airplane not started, please start"
    end
    fuelCheck
  end


end
