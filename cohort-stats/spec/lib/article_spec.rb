describe Article do
  let(:magazine_article) { Article.new("Best Biking Practice", "Learn how not to die in traffic.") }

  describe "#submittable?" do
    it "should always return false" do
      expect(magazine_article.submittable?).to eq(false)
    end
  end

  describe "#average_grade" do
    it "should not have access to this method" do
      expect{ magazine_article.average_grade }.to raise_error(NoMethodError)
    end
  end
end
