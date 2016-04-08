require 'rails_helper'

feature 'salesperson records car manufacturer' do
  scenario 'salesperson adds name and country' do
    visit new_manufacturer_path

    fill_in "Name", with: "Subaru"
    fill_in "Country", with: "Japan"
    click_on "Submit"

    expect(page).to have_content("Manufacturers")
    expect(page).to have_content("Subaru")
  end

  scenario 'salesperson does not add all fields' do
    visit new_manufacturer_path

    click_on "Submit"
    expect(page).to have_content("Name can't be blank.")
    expect(page).to have_content("New Manufacturer Form")
  end
end
