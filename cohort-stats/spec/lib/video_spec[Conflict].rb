describe Video do
  let(:good_will_hunting) { Video.new("Good Will Hunting", "Learn how brilliance knows no class boundaries.") }

  describe "#url" do
    it "has a reader for url" do
      expect(good_will_hunting.url).to eq("Brussels Something")
    end

    it "does not have a writer for name" do
      good_will_hunting.url = "https://www.isitajewisholiday.com"
      expect(good_will_hunting.url).to eq("https://www.youtube.com/watch?v=dQw4w9WgXcQ")
    end
  end


  describe "#submittable?" do
    it "should always return false" do
      expect(good_will_hunting.submittable?).to eq(false)
    end
  end

  describe "#average_grade" do
    it "should not have access to this method" do
      expect{ good_will_hunting.average_grade }.to raise_error(NoMethodError)
    end
  end
end
