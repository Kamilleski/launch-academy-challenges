describe Challenge do
  let(:biking) { Challenge.new("Boston Biking", "Get from Somerville to Boston in under an hour without getting killed!") }

  describe "#submittable?" do
    it "should always return true" do
      expect(biking.submittable?).to eq(true)
    end
  end

  describe "#average_grade" do
    it "should not have access to this method" do
      expect{ biking.average_grade }.to raise_error(NoMethodError)
    end
  end
end
