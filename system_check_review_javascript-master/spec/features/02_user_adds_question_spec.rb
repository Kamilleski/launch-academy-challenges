require "spec_helper"

feature "user add poro", js: true do

  scenario "successfully add poro" do
    visit "/poros"
    fill_in "name", with: "Carrie Porostein"

    expect_no_page_reload do
      click_button "Add"
      expect(page).to have_content "Carrie Porostein"
    end
  end

  scenario "submit form without name" do
    visit "/poros"

    expect_no_page_reload do
      click_button "Add"
      expect(page).to_not have_css("li")
    end
  end
end
