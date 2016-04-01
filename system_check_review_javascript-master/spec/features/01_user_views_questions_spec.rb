require "spec_helper"

feature "user views poros" do
  scenario "sees poros" do
    db_connection do |conn|
      sql_query = "INSERT INTO poros (name) VALUES ($1)"
      data = ["Carrie!"]
      conn.exec_params(sql_query, data)
    end

    visit "/poros"
    expect(page).to have_content("Carrie!")
  end
end
