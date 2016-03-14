require 'csv'
require 'pg'

def db_connection
  begin
    connection = PG.connect(dbname: "mass_health")
    yield(connection)
  ensure
    connection.close
  end
end

CSV.foreach("mass-chip-data.csv", headers: true) do |row|
  @locality = row[0]
  @population = row[1].delete(',').to_i
  @young_population = row[2].delete(',').to_i
  @old_population = row[3].delete(',').to_i
  @per_capita_income = row[4].delete(',').delete('$').to_i
  @poverty_population = row[5].delete(',').to_i
  @poverty_percent = row[6].to_f
  @adequate_prenatal_percent = row[7].to_f
  @c_section_percent = row[8].to_f
  @infant_deaths = row[9].to_i
  @infant_mortality_rate = row[10].to_f
  @low_birthweight_percent = row[11].to_f
  @multiple_birth_percent = row[12].to_f
  @public_prenatal_care = row[13].to_f
  @teen_births = row[14].to_f

  sql = "INSERT INTO town_health_records (locality, population, population_under_20_yrs, population_over_65_yrs, per_capita_income, population_below_200_percent_poverty, percent_population_below_200_percent_poverty, percent_adequate_prenatal_care, c_sections_percentage, infant_deaths, infant_mortality_rate_per_thousand, low_birthweight_percentage, multiple_birth_percentage, publicly_financed_prenatal_care_percentage, teen_births_percentage) VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14, $15)"
  db_connection  do |conn|
    conn.exec_params(sql, [@locality, @population, @young_population, @old_population, @per_capita_income, @poverty_population, @poverty_percent, @adequate_prenatal_percent, @c_section_percent, @infant_deaths, @infant_mortality_rate, @low_birthweight_percent, @multiple_birth_percent, @public_prenatal_care, @teen_births])
  end
end
