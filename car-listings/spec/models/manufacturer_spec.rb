require 'rails_helper'

describe Manufacturer do
  it { should have_valid(:name).when("Subaru", "Land Rover") }
  it { should_not have_valid(:name).when(nil, "") }

  it { should have_valid(:country).when("USA", "New Guinea") }
  it { should_not have_valid(:country).when(nil, "") }
end
