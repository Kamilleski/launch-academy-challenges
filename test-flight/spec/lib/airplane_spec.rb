require_relative "../../lib/airplane"


describe Airplane do

  let(:airplane) {Airplane.new("cesna", 10, 150)}

  describe "#initialization" do
    it "should be an Airplane object" do
      expect(airplane.class).to eq(Airplane)
    end

    it "should be a cesna type" do
      expect(airplane.type).to eq("cesna")
    end

    it "should have a wing loading capacity" do
      expect(airplane.wing_loading).to eq(10)
    end

    it "should have a horsepower value" do
      expect(airplane.horsepower).to eq(150)
    end
  end

  describe "#start" do
    it "should not start automatically" do
      expect{airplane.start}.to output("airplane started").to_stdout
    end

    it "should display whether already running" do
      airplane.start
      expect{airplane.start}.to output("airplane already started").to_stdout
    end

    it "should reduce fuel amount by 10" do
      airplane.start
      expect(airplane.fuel).to eq(90)
    end
  end

  describe "#land" do
    it "should display message that plane is not started" do
      expect{airplane.land}.to output("airplane not started, please start").to_stdout
    end

    it "should display message that airplane never started flying" do
      airplane.running = true
      expect{airplane.land}.to output("airplane already on the ground").to_stdout
    end

    it "should display message that plane has landed" do
      airplane.running = true
      airplane.flying = true
      expect{airplane.land}.to output("airplane landed").to_stdout
    end

    it "should reduce fuel amount by 30" do
      airplane.land
      expect(airplane.fuel).to eq(70)
    end
  end

  describe "#takeoff" do
    it "should display message that plane is not started" do
      expect{airplane.takeoff}.to output("airplane not started, please start").to_stdout
    end

    it "should display message that airplane has launched" do
      airplane.start
      expect{airplane.takeoff}.to output("airplane launched").to_stdout
    end

    it "should reduce fuel amount by 50" do
      airplane.start
      airplane.takeoff
      expect(airplane.fuel).to eq(40)
    end
  end

  describe "#fuelCheck" do
    it "should display provided error message that there is too little fuel" do
      doomed_flight = Airplane.new("boeing", 10, 150, 5)
      expect{doomed_flight.start}.to output("not enough fuel left to complete that action").to_stdout
    end
  end
end
