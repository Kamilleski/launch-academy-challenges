require 'rails_helper'

describe Car do
  it { should have_valid(:manufacturer_id).when(1, 3) }
  it { should_not have_valid(:manufacturer_id).when(nil, "") }

  it { should have_valid(:color).when("Red", "Light Blue") }
  it { should_not have_valid(:color).when(nil, "") }

  it { should have_valid(:year).when(1920, 2014) }
  it { should_not have_valid(:year).when(nil, 1919) }

  it { should have_valid(:mileage).when(333, 0) }
  it { should_not have_valid(:mileage).when(nil, "") }
end
