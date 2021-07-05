# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

# Examples:

#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# User.destroy_all
# Source.destroy_all
# Comment.destroy_all
# Quote.destroy_all
# Folder.destroy_all

# User --------------------------------------------------------------
print("Creating Users")
tim = User.create!(email: "timjenner1998@gmail.com", first_name: "Tim", last_name: "Jenner", username: "timjenner", password: "123456")
marc = User.create!(email: "mar_on_themove@hotmail.com", first_name: "Marc", last_name: "Gaetcke", username: "MARConthemove", password: "123456")
max = User.create!(email: "maximilian@glasmacher.com", first_name: "Max", last_name: "Glasmacher", username:"maximilian", password: "123456")

# Folder ------------------------------------------------------------
us_politics_tim = Folder.create!(folder_name: "US Politics", user_id: tim.id)
us_politics_marc = Folder.create!(folder_name: "US Politics", user_id: marc.id)
us_politics_max = Folder.create!(folder_name: "US Politics", user_id: max.id)

international_incidents_tim = Folder.create!(folder_name: "International Incidents", user_id: tim.id)
international_incidents_marc = Folder.create!(folder_name: "International Incidents", user_id: marc.id)
international_incidents_max = Folder.create!(folder_name: "International Incidents", user_id: max.id)

sports_tim = Folder.create!(folder_name: "Sports", user_id: tim.id)
sports_marc = Folder.create!(folder_name: "Sports", user_id: marc.id)
sports_max = Folder.create!(folder_name: "Sports", user_id: max.id)


# Tim
source = Source.create!(title: "Trump's postal-vote tweet misleading, says Twitter", website: "bbc.co.uk", url_of_website: "https://www.bbc.com/news/technology-53888376", user_id: tim.id, folder_id: us_politics_tim.id)
#quote = Quote.create!(content: "this is such a great first quote this is such a great first quote this is such a great first quote this is such a great first quote this is such a great first quote", source_id: source.id, url_of_quote: source.url_of_website, user_id: tim.id)
#comment = Comment.create!(content: "this is so absolutely great and I think this is so true aswell!", quote_id: quote.id, user_id: tim.id)

Quote.create!(content: "Trump tim quote 2", source_id: source.id, url_of_quote: source.url_of_website, user_id: tim.id)
Quote.create!(content: "Trump tim quote 3", source_id: source.id, url_of_quote: source.url_of_website, user_id: tim.id)
Quote.create!(content: "Trump tim quote 4", source_id: source.id, url_of_quote: source.url_of_website, user_id: tim.id)
Quote.create!(content: "Trump tim quote 5", source_id: source.id, url_of_quote: source.url_of_website, user_id: tim.id)
Quote.create!(content: "Trump tim quote 6", source_id: source.id, url_of_quote: source.url_of_website, user_id: tim.id)


source = Source.create!(title: "Joe Biden formally accepts Democratic nomination", website: "bbc.co.uk", url_of_website: "https://www.bbc.co.uk/programmes/w172x2yv3thdy4k", user_id: tim.id, folder_id: us_politics_tim.id)
Quote.create!(content: "Biden tim quote 1", source_id: source.id, url_of_quote: source.url_of_website, user_id: tim.id)
Quote.create!(content: "Biden tim quote 2", source_id: source.id, url_of_quote: source.url_of_website, user_id: tim.id)
Quote.create!(content: "Biden tim quote 3", source_id: source.id, url_of_quote: source.url_of_website, user_id: tim.id)
Quote.create!(content: "Biden tim quote 4", source_id: source.id, url_of_quote: source.url_of_website, user_id: tim.id)
Quote.create!(content: "Biden tim quote 5", source_id: source.id, url_of_quote: source.url_of_website, user_id: tim.id)
Quote.create!(content: "Biden tim quote 6", source_id: source.id, url_of_quote: source.url_of_website, user_id: tim.id)

# Marc
source = Source.create!(title: "Trump's postal-vote tweet misleading, says Twitter", website: "bbc.co.uk", url_of_website: "https://www.bbc.com/news/technology-53888376", user_id: marc.id, folder_id: us_politics_marc.id)
Quote.create!(content: "Trump marc quote 2", source_id: source.id, url_of_quote: source.url_of_website, user_id: marc.id)
Quote.create!(content: "Trump marc quote 3", source_id: source.id, url_of_quote: source.url_of_website, user_id: marc.id)
Quote.create!(content: "Trump marc quote 4", source_id: source.id, url_of_quote: source.url_of_website, user_id: marc.id)
Quote.create!(content: "Trump marc quote 5", source_id: source.id, url_of_quote: source.url_of_website, user_id: marc.id)
Quote.create!(content: "Trump marc quote 6", source_id: source.id, url_of_quote: source.url_of_website, user_id: marc.id)

source = Source.create!(title: "Joe Biden formally accepts Democratic nomination", website: "bbc.co.uk", url_of_website: "https://www.bbc.co.uk/programmes/w172x2yv3thdy4k", user_id: marc.id, folder_id: us_politics_marc.id)
Quote.create!(content: "Biden marc quote 1", source_id: source.id, url_of_quote: source.url_of_website, user_id: marc.id)
Quote.create!(content: "Biden marc quote 2", source_id: source.id, url_of_quote: source.url_of_website, user_id: marc.id)
Quote.create!(content: "Biden marc quote 3", source_id: source.id, url_of_quote: source.url_of_website, user_id: marc.id)
Quote.create!(content: "Biden marc quote 4", source_id: source.id, url_of_quote: source.url_of_website, user_id: marc.id)
Quote.create!(content: "Biden marc quote 5", source_id: source.id, url_of_quote: source.url_of_website, user_id: marc.id)
Quote.create!(content: "Biden marc quote 6", source_id: source.id, url_of_quote: source.url_of_website, user_id: marc.id)

# Max
source = Source.create!(title: "Trump's postal-vote tweet misleading, says Twitter", website: "bbc.co.uk", url_of_website: "https://www.bbc.com/news/technology-53888376", user_id: max.id, folder_id: us_politics_max.id)

Quote.create!(content: "Trump max quote 1", source_id: source.id, url_of_quote: source.url_of_website, user_id: max.id)
Quote.create!(content: "Trump max quote 2", source_id: source.id, url_of_quote: source.url_of_website, user_id: max.id)
Quote.create!(content: "Trump max quote 3", source_id: source.id, url_of_quote: source.url_of_website, user_id: max.id)
Quote.create!(content: "Trump max quote 4", source_id: source.id, url_of_quote: source.url_of_website, user_id: max.id)
Quote.create!(content: "Trump max quote 5", source_id: source.id, url_of_quote: source.url_of_website, user_id: max.id)
Quote.create!(content: "Trump max quote 6", source_id: source.id, url_of_quote: source.url_of_website, user_id: max.id)

source = Source.create!(title: "Joe Biden formally accepts Democratic nomination", website: "bbc.co.uk", url_of_website: "https://www.bbc.co.uk/programmes/w172x2yv3thdy4k", user_id: max.id, folder_id: us_politics_max.id)
Quote.create!(content: "Biden max quote 1", source_id: source.id, url_of_quote: source.url_of_website, user_id: max.id)
Quote.create!(content: "Biden max quote 2", source_id: source.id, url_of_quote: source.url_of_website, user_id: max.id)
Quote.create!(content: "Biden max quote 3", source_id: source.id, url_of_quote: source.url_of_website, user_id: max.id)
Quote.create!(content: "Biden max quote 4", source_id: source.id, url_of_quote: source.url_of_website, user_id: max.id)
Quote.create!(content: "Biden max quote 5", source_id: source.id, url_of_quote: source.url_of_website, user_id: max.id)
Quote.create!(content: "Biden max quote 6", source_id: source.id, url_of_quote: source.url_of_website, user_id: max.id)

# Follows

Relationship.create!(asker: max, receiver: tim, status: 1)
Relationship.create!(asker: max, receiver: marc, status: 1)

Relationship.create!(asker: marc, receiver: tim, status: 1)
Relationship.create!(asker: marc, receiver: max, status: 1)

Relationship.create!(asker: tim, receiver: marc, status: 1)
Relationship.create!(asker: tim, receiver: max, status: 1)





# INTERNATIONAL INCIDENTS
# Tim
# Source.create!(title: "Covid-19 Live Updates: Researchers Document First Case of Virus Reinfection", website: "nytimes.com", url_of_website: "https://www.nytimes.com/2020/08/24/world/covid-19-coronavirus.html?action=click&module=Top%20Stories&pgtype=Homepage", user_id: tim.id, folder_id: international_incidents_tim.id)
# Source.create!(title: "Beirut explosion: Port officials under house arrest as rescue efforts continue", website: "bbc.co.uk", url_of_website: "https://www.bbc.com/news/world-middle-east-53670839", user_id: tim.id, folder_id: international_incidents_tim.id)

# # Marc
# Source.create!(title: "Covid-19 Live Updates: Researchers Document First Case of Virus Reinfection", website: "nytimes.com", url_of_website: "https://www.nytimes.com/2020/08/24/world/covid-19-coronavirus.html?action=click&module=Top%20Stories&pgtype=Homepage", user_id: marc.id, folder_id: international_incidents_marc.id)
# Source.create!(title: "Beirut explosion: Port officials under house arrest as rescue efforts continue", website: "bbc.co.uk", url_of_website: "https://www.bbc.com/news/world-middle-east-53670839", user_id: marc.id, folder_id: international_incidents_marc.id)

# # Max
# Source.create!(title: "Covid-19 Live Updates: Researchers Document First Case of Virus Reinfection", website: "nytimes.com", url_of_website: "https://www.nytimes.com/2020/08/24/world/covid-19-coronavirus.html?action=click&module=Top%20Stories&pgtype=Homepage", user_id: max.id, folder_id: international_incidents_max.id)
# Source.create!(title: "Beirut explosion: Port officials under house arrest as rescue efforts continue", website: "bbc.co.uk", url_of_website: "https://www.bbc.com/news/world-middle-east-53670839", user_id: max.id, folder_id: international_incidents_max.id)

# # SPORTS
# # Tim
# Source.create!(title: "Ver­dienter geht es kaum", website: "11freunde.de", url_of_website: "https://11freunde.de/artikel/verdienter-geht-es-kaum/2538567", user_id: tim.id, folder_id: sports_tim.id)
# Source.create!(title: "World No 304 Sophia Popov holds nerve to claim shock Women's Open title", website: "theguardian.com", url_of_website: "https://www.theguardian.com/sport/2020/aug/23/sophia-popov-holds-her-nerve-and-lands-first-major-with-the-womens-open", user_id: tim.id, folder_id: sports_tim.id)

# # Marc
# Source.create!(title: "Ver­dienter geht es kaum", website: "11freunde.de", url_of_website: "https://11freunde.de/artikel/verdienter-geht-es-kaum/2538567", user_id: marc.id, folder_id: sports_marc.id)
# Source.create!(title: "World No 304 Sophia Popov holds nerve to claim shock Women's Open title", website: "theguardian.com", url_of_website: "https://www.theguardian.com/sport/2020/aug/23/sophia-popov-holds-her-nerve-and-lands-first-major-with-the-womens-open", user_id: marc.id, folder_id: sports_marc.id)

# # Max
# Source.create!(title: "Ver­dienter geht es kaum", website: "11freunde.de", url_of_website: "https://11freunde.de/artikel/verdienter-geht-es-kaum/2538567", user_id: max.id, folder_id: sports_max.id)
# Source.create!(title: "World No 304 Sophia Popov holds nerve to claim shock Women's Open title", website: "theguardian.com", url_of_website: "https://www.theguardian.com/sport/2020/aug/23/sophia-popov-holds-her-nerve-and-lands-first-major-with-the-womens-open", user_id: max.id, folder_id: sports_max.id)

["news", "covid", "india", "instagram", "love", "coronavirus", "follow", "like", "media", "music", "breakingnews", "instagood", "fashion", "viral", "trending", "politics", "noticias", "memes", "new", "corona", "usa", "football", "bhfyp", "sports", "tv", "indonesia", "berita", "photography", "currentaffairs", "bhfyp", "info", "style", "entertainment", "business", "world", "art", "instadaily", "trump", "newspaper", "moda", "lockdown", "life", "upsc", "update", "likeforlikes", "youtube", "followforfollowback", "sport", "stayhome", "meme", "f", "lifestyle", "video", "photooftheday", "hiphop", "s", "updates", "likes", "instalike", "instanews", "covid", "coronavirus", "corona", "stayhome", "love", "quarantine", "bhfyp", "lockdown", "staysafe", "instagood", "instagram", "like", "art", "follow", "socialdistancing", "photography", "pandemic", "virus", "india", "dirumahaja", "stayathome", "health", "d", "life", "a", "memes", "fashion", "music", "bhfyp", "photooftheday", "cov", "happy", "travel", "pandemia", "n", "repost", "covi", "nature", "news", "quedateencasa", "fitness", "likeforlikes", "cuarentena", "indonesia", "s", "mask", "beauty", "tiktok", "inspiration", "yourself", "followforfollowback", "viral", "mentalhealth", "family", "meme", "quotes", "lifestyle", "quarantinelife", "business", "economics", "economy", "finance", "business", "economist", "money", "macroeconomics", "commerce", "politics", "microeconomics", "covid", "india", "education", "econometrics", "motivation", "indianeconomy", "upsc", "news", "economicsmemes", "history", "capitalism", "stockmarket", "studygram", "class", "economic", "stocks", "economia", "internationaleconomics", "entrepreneur", "bhfyp", "coronavirus", "economists", "memes", "study", "bhfyp", "gdp", "freedom", "school", "cbse", "publicfinance", "management", "econmemes", "schoolofeconomics", "economicsmajor", "econ", "dse", "investment", "follow", "netjrf", "geography", "statistics", "economicstudent", "economicdevelopment", "usa", "accounting", "university", "ias", "science", "libertarian", "socialism", "internationalrelations", "politics", "diplomacy", "mun", "unitednations", "modelunitednations", "youth", "un", "internationalconference", "internationalmun", "youthleader", "munconference", "debate", "peace", "india", "globalizon", "diversity", "internationalaffairs", "asiamun", "foreignpolicy", "security", "conference", "upsc", "foreignaffairs", "modelun", "globalaffairs", "youthpower", "humansecurity", "policy", "bhfyp", "startups", "business", "startup", "entrepreneur", "entrepreneurship", "startuplife", "entrepreneurs", "marketing", "smallbusiness", "startupbusiness", "businessowner", "innovation", "success", "technology", "digitalmarketing", "entrepreneurlife", "tech", "motivation", "branding", "businesstips", "startupindia", "startuptips", "startupstory", "money", "venturecapital", "businessowners", "investment", "covid", "inspiration", "bhfyp", "socialmedia", "hustle", "entrepreneurmindset", "socialmediamarketing", "businessman", "india", "coworking", "businesswoman", "ecommerce", "networking", "leadership", "design", "businessideas", "funding", "investors", "startupstories", "onlinemarketing", "empreendedorismo", "startupideas", "startupgrind", "o", "womeninbusiness", "finance", "marketingdigital", "startupcompany", "instagram", "mindset", "founders", "seo", "b", "venturecapital", "startup", "startups", "entrepreneur", "entrepreneurship", "privateequity", "business", "vc", "venturecapitalist", "funding", "technology", "investing", "entrepreneurs", "investor", "investors", "investment", "success", "tech", "startuplife", "innovation", "marketing", "smallbusiness", "angelinvestor", "money", "finance", "startupfunding", "founder", "motivation", "digitalmarketing", "bhfyp", "blockchain", "angelinvestors", "strategy", "entrepreneurlife", "startupbusiness", "ceo", "founders", "familyoffices", "branding", "venture", "investimento", "empreender", "covid", "invest", "globalcapitalnetwork", "businessowner", "startupindia", "sharktank", "b", "businessgrowth", "bhfyp", "investornetwork", "capital", "cryptocurrency", "billionaires", "negocios", "investidoranjo", "millionaire", "inovacao", "siliconvalley", "finance", "business", "money", "investing", "investment", "entrepreneur", "financialfreedom", "wealth", "success", "stocks", "trading", "stockmarket", "invest", "bitcoin", "motivation", "forex", "realestate", "investor", "accounting", "cryptocurrency", "covid", "wallstreet", "personalfinance", "entrepreneurship", "marketing", "financialliteracy", "smallbusiness", "crypto", "credit", "bhfyp", "movies", "movie", "film", "cinema", "films", "hollywood", "love", "actor", "s", "art", "actress", "cinematography", "netflix", "music", "moviescenes", "bollywood", "instagood", "horror", "filmmaking", "instagram", "photography", "movienight", "comedy", "cine", "cinephile", "drama", "tv", "director", "bhfyp", "bhfyp", "music", "love", "hiphop", "art", "rap", "musician", "instagood", "artist", "follow", "instagram", "like", "singer", "musica", "dj", "rock", "life", "dance", "photography", "s", "song", "bhfyp", "guitar", "happy", "nature", "style", "viral", "producer", "fashion", "newmusic", "bhfyp", "memes", "model", "party", "photooftheday", "beauty", "photo", "live", "tiktok", "beats", "musicvideo", "trap", "insta", "explorepage", "lifestyle", "selfie", "rapper", "likeforlikes", "video", "instamusic", "k", "travel", "girl", "youtube", "livemusic", "myself", "smile", "pop", "india", "concert", "followforfollowback", "biden", "trump", "election", "joebiden", "vote", "maga", "usa", "democrats", "bidenharris", "politics", "democrat", "donaldtrump", "america", "covid", "blacklivesmatter", "republican", "blm", "kamalaharris", "bernie", "conservative", "berniesanders", "voteblue", "memes", "liberal", "obama", "president", "kag", "coronavirus", "republicans", "bhfyp"].uniq.each do |tag|
    Tag.create(name: "#{tag}")
end
