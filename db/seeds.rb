# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

tim = User.create!(email: "timjenner1998@gmail.com", first_name: "Tim", last_name: "Jenner", username: "timjenner", password: "123456")
marc = User.create!(email: "marc_onthemove@hotmail.com", first_name: "Marc", last_name: "Gaetcke", username: "MARConthemove", password: "123456")
max = User.create!(email: "maximilian@glasmacher.com", first_name: "Max", last_name: "Glasmacher", username:"maximilian", password: "123456")

us_politics_tim = Folder.create!(folder_name: "US Politics", user_id: tim.id)
us_politics_marc = Folder.create!(folder_name: "US Politics", user_id: marc.id)
us_politics_max = Folder.create!(folder_name: "US Politics", user_id: max.id)

international_incidents_tim = Folder.create!(folder_name: "International Incidents", user_id: tim.id)
international_incidents_marc = Folder.create!(folder_name: "International Incidents", user_id: marc.id)
international_incidents_max = Folder.create!(folder_name: "International Incidents", user_id: max.id)

sports_tim = Folder.create!(folder_name: "Sports", user_id: tim.id)
sports_marc = Folder.create!(folder_name: "Sports", user_id: marc.id)
sports_max = Folder.create!(folder_name: "Sports", user_id: max.id)

# US POLITICS
# Tim
Source.create!(title: "Trump's postal-vote tweet misleading, says Twitter", website: "bbc.co.uk", url_of_website: "https://www.bbc.com/news/technology-53888376", user_id: tim.id, folder_id: us_politics_tim.id)
Source.create!(title: "Joe Biden formally accepts Democratic nomination", website: "bbc.co.uk", url_of_website: "https://www.bbc.co.uk/programmes/w172x2yv3thdy4k", user_id: tim.id, folder_id: us_politics_tim.id)

# Marc
Source.create!(title: "Trump's postal-vote tweet misleading, says Twitter", website: "bbc.co.uk", url_of_website: "https://www.bbc.com/news/technology-53888376", user_id: marc.id, folder_id: us_politics_marc.id)
Source.create!(title: "Joe Biden formally accepts Democratic nomination", website: "bbc.co.uk", url_of_website: "https://www.bbc.co.uk/programmes/w172x2yv3thdy4k", user_id: marc.id, folder_id: us_politics_marc.id)

# Max
Source.create!(title: "Trump's postal-vote tweet misleading, says Twitter", website: "bbc.co.uk", url_of_website: "https://www.bbc.com/news/technology-53888376", user_id: max.id, folder_id: us_politics_max.id)
Source.create!(title: "Joe Biden formally accepts Democratic nomination", website: "bbc.co.uk", url_of_website: "https://www.bbc.co.uk/programmes/w172x2yv3thdy4k", user_id: max.id, folder_id: us_politics_max.id)

# INTERNATIONAL INCIDENTS
# Tim
Source.create!(title: "Covid-19 Live Updates: Researchers Document First Case of Virus Reinfection", website: "nytimes.com", url_of_website: "https://www.nytimes.com/2020/08/24/world/covid-19-coronavirus.html?action=click&module=Top%20Stories&pgtype=Homepage", user_id: tim.id, folder_id: international_incidents_tim.id)
Source.create!(title: "Beirut explosion: Port officials under house arrest as rescue efforts continue", website: "bbc.co.uk", url_of_website: "https://www.bbc.com/news/world-middle-east-53670839", user_id: tim.id, folder_id: international_incidents_tim.id)

# Marc
Source.create!(title: "Covid-19 Live Updates: Researchers Document First Case of Virus Reinfection", website: "nytimes.com", url_of_website: "https://www.nytimes.com/2020/08/24/world/covid-19-coronavirus.html?action=click&module=Top%20Stories&pgtype=Homepage", user_id: marc.id, folder_id: international_incidents_marc.id)
Source.create!(title: "Beirut explosion: Port officials under house arrest as rescue efforts continue", website: "bbc.co.uk", url_of_website: "https://www.bbc.com/news/world-middle-east-53670839", user_id: marc.id, folder_id: international_incidents_marc.id)

# Max
Source.create!(title: "Covid-19 Live Updates: Researchers Document First Case of Virus Reinfection", website: "nytimes.com", url_of_website: "https://www.nytimes.com/2020/08/24/world/covid-19-coronavirus.html?action=click&module=Top%20Stories&pgtype=Homepage", user_id: max.id, folder_id: international_incidents_max.id)
Source.create!(title: "Beirut explosion: Port officials under house arrest as rescue efforts continue", website: "bbc.co.uk", url_of_website: "https://www.bbc.com/news/world-middle-east-53670839", user_id: max.id, folder_id: international_incidents_max.id)

# SPORTS
# Tim
Source.create!(title: "Ver­dienter geht es kaum", website: "11freunde.de", url_of_website: "https://11freunde.de/artikel/verdienter-geht-es-kaum/2538567", user_id: tim.id, folder_id: sports_tim.id)
Source.create!(title: "World No 304 Sophia Popov holds nerve to claim shock Women's Open title", website: "theguardian.com", url_of_website: "https://www.theguardian.com/sport/2020/aug/23/sophia-popov-holds-her-nerve-and-lands-first-major-with-the-womens-open", user_id: tim.id, folder_id: sports_tim.id)

# Marc
Source.create!(title: "Ver­dienter geht es kaum", website: "11freunde.de", url_of_website: "https://11freunde.de/artikel/verdienter-geht-es-kaum/2538567", user_id: marc.id, folder_id: sports_marc.id)
Source.create!(title: "World No 304 Sophia Popov holds nerve to claim shock Women's Open title", website: "theguardian.com", url_of_website: "https://www.theguardian.com/sport/2020/aug/23/sophia-popov-holds-her-nerve-and-lands-first-major-with-the-womens-open", user_id: marc.id, folder_id: sports_marc.id)

# Max
Source.create!(title: "Ver­dienter geht es kaum", website: "11freunde.de", url_of_website: "https://11freunde.de/artikel/verdienter-geht-es-kaum/2538567", user_id: max.id, folder_id: sports_max.id)
Source.create!(title: "World No 304 Sophia Popov holds nerve to claim shock Women's Open title", website: "theguardian.com", url_of_website: "https://www.theguardian.com/sport/2020/aug/23/sophia-popov-holds-her-nerve-and-lands-first-major-with-the-womens-open", user_id: max.id, folder_id: sports_max.id)
