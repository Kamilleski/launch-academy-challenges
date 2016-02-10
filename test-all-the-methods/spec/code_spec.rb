require "simplecov"
SimpleCov.start
require "pry"
require_relative "../code"

# YOUR TEST CODE HERE
describe "perimeter" do
  it "should be four times width" do
    result = perimeter(3)
    expect(result).to eq(12)
  end
  it "should be two times width plus two times height" do
    result = perimeter(3, 2)
    expect(result).to eq(10)
  end
end

describe "average" do
  it "should equal average of all grades" do
    result = average([1, 2, 3, 4, 5])
    expect(result).to eq(3)
  end
end

describe "rankings" do
  test_students = ["Kamille", "Bobby", "Siobhan"]
  it "should return a string with each student's name and number" do
    result = rankings(test_students)
    expect(result).to eq("1. Kamille\n2. Bobby\n3. Siobhan\n")
  end
end

describe "greet" do
  it "should return a greeting in the default language" do
    expect{ greet("Þór") }.to output("Hi Þór!\n").to_stdout
  end
  it "should return a greeting in Latin" do
    expect{ greet("Freyja", "latin") }.to output("Salve Freyja!\n").to_stdout
  end
  it "should return a greeting in French" do
    expect{ greet("Loki", "french") }.to output("Bonjour Loki!\n").to_stdout
  end
  it "should return a greeting in Italian" do
    expect{ greet("Óðinn", "italian") }.to output("Ciao Óðinn!\n").to_stdout
  end
  it "should return a greeting in Spanish" do
    expect{ greet("Heimdallur", "spanish") }.to output("Hola Heimdallur!\n").to_stdout
  end
end
