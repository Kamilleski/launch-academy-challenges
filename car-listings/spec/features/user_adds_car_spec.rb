require 'rails_helper'

feature 'user adds a car' do
  scenario 'user successfully adds a car' do
    Manufacturer.create(name: "Ferrari", country: "Italy")
    visit new_car_path
    save_and_open_page

    select "Ferrari", from: "Manufacturer"
    fill_in "Color", with: "Baby Blue"
    fill_in "Year", with: "2016"
    fill_in "Mileage", with: "0"

    click_on "Submit"

    expect(page).to have_content("Car added successfully!")
  end

  scenario 'user adds car that is too old' do
    visit new_car_path

    fill_in "Color", with: "Baby Blue"
    fill_in "Year", with: "1800"
    fill_in "Mileage", with: "0"

    click_on "Submit"

    expect(page).to have_content("Year must be greater than or equal to 1920")
    expect(page).to_not have_content("Car added successfully!")
  end
end
