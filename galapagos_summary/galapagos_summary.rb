leave_date = "March 13th"
return_date = "April 9th"
hotel_name = "Ritz Carlton"
iguanas_seen = 23
favorite_beach = "North Shore"
giant_tortoises_seen = 99
rounded_number_total_animals = 10 * ((iguanas_seen + giant_tortoises_seen)/10).floor


puts "We left #{leave_date} for The Galapagos Islands and stayed at the #{hotel_name} hotel. ",
"During the trip I saw over #{rounded_number_total_animals} animals. ",
"My favorite beach during the trip was #{favorite_beach}. ",
"After an amazing trip we returned on #{return_date}.  Can't wait to go back!"
