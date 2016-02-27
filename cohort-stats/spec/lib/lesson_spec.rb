describe Lesson do
  let(:pedagogy) { Lesson.new("Brussels Something", "The point of this lesson is to just give y'all a cool recipe.") }

  describe ".new" do
    it "has a reader for name" do
      expect(pedagogy.name).to eq("Brussels Something")
    end

    it "has a writer for name" do
      pedagogy.name = "Kamille learns how to use maps"
      expect(pedagogy.name).to eq("Kamille learns how to use maps")
    end

    it "has a reader for body" do
      expect(pedagogy.body).to eq("The point of this lesson is to just give y'all a cool recipe.")
    end

    it "has a writer for body" do
      pedagogy.body = "Maps are hard to use when you're not looking at them."
      expect(pedagogy.body).to eq("Maps are hard to use when you're not looking at them.")
    end
  end

  describe "#submittable?" do
    it "should always return false" do
      expect(pedagogy.submittable?).to eq(false)
    end
  end
end
