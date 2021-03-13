require 'date'
require 'open-uri'

puts "Clearing the database of all existing elements"
CashYield.destroy_all
Subscription.destroy_all
Project.destroy_all
User.destroy_all

file = URI.open('https://i.pinimg.com/originals/c4/82/14/c4821446d3c902647a6ea0cf39f38419.jpg')

project = Project.create!(name: "Fawn Creek Pistachio Orchard", amount: rand(5..150)*100000, funded: false,
  location: "Tulare County, CA", crop: "Pistachios",
  description: "Fawn Creek is comprised of 60 contiguous acres in Tulare County, California, approximately 4 miles north east of our Deer Creek Pistachio Orchard - both located in the same county. Of the 60 gross acres, 100% are planted to Golden Hills variety pistachios. Half the trees were planted in 2016 and the other half was planted in 2018. This deal is modeled as a 10-year hold with a target net IRR of 9.5%, a target net average cash yield of 8.0%, and a target multiple on invested capital of 2.1x. Net cash yield averages 3.5% in the first five years and 12.5% in the remaining five years. The purchase price is $2,000,000, or $100,000 (5.0%) below the listed asking price. At exit, we believe this will be attractive to large growers and investors.",
  start_date: Faker::Date.between(from: '2021-03-15', to: '2021-12-31'),
  maturity_date: Faker::Date.between(from: '2026-03-15', to: '2036-12-31').end_of_month,
  ltv_ratio: 0.4, management_fee: 0.01, transaction_fee: 0.02)

project.banner_picture.attach(io: file, filename: 'pistachios-orchad.png', content_type: 'image/png')

file = URI.open('https://s.abcnews.com/images/International/GTY_Iowa_Cornfield_MEM_161006_16x9_1600.jpg')

project = Project.create!(name: "Rinehart Farm", amount: rand(5..150)*100000, funded: false,
  location: "Stephenson County, IL", crop: "Corn",
  description: "This investment is a unique opportunity to own top quality row crop farmland sourced and managed by a highly experienced institutional-level investment firm, Farmland Opportunity. The Rinehart Farm comprises 157 acres in one contiguous lot located in prime farm country in Stephenson County, Illinois. The deal is completely off-market and came through proprietary relationships, which allowed us to get the deal at a 7%+ discount to market.",
  start_date: Faker::Date.between(from: '2021-03-15', to: '2021-12-31'),
  maturity_date: Faker::Date.between(from: '2026-03-15', to: '2036-12-31').end_of_month,
  ltv_ratio: 0, management_fee: 0.01, transaction_fee: 0.02)

project.banner_picture.attach(io: file, filename: 'cornfield.png', content_type: 'image/png')

file = URI.open('https://www.fruitandveggie.com/wp-content/uploads/2019/12/3106bf9bc778356da6f1eeb1f4ca0f5d.jpg')

project = Project.create!(name: "Galaxy Organic Apple Orchard", amount: rand(5..150)*100000, funded: false,
  location: "Franklin County, WA", crop: "Apples",
  description: "Galaxy Apple Orchard is located in the heart of Washington’s apple belt, Franklin County, WA. The orchard consists of 201 acres planted to mature apple trees. The plan is to redevelop 100% of the property into an organic apple orchard over the next 2 years. The soils are suitable for this organic transition; we project to plant two premium varietals, Cosmic Crisp® and SweeTango®, praised for their balanced flavor profile and backed by strong marketing efforts. We have identified an excellent operator in the area, Stemilt Growers, and are finalizing an agreement with them. This acquisition is a 10-year hold with a target net IRR of 15.0% and a target net average cash yield of 19.6%. At exit, this property will be a turnkey operation attractive to large growers and investors.",
  start_date: Faker::Date.between(from: '2021-03-15', to: '2021-12-31'),
  maturity_date: Faker::Date.between(from: '2026-03-15', to: '2036-12-31').end_of_month,
  ltv_ratio: 0.39, management_fee: 0.01, transaction_fee: 0.02)

project.banner_picture.attach(io: file, filename: 'apples-orchad.png', content_type: 'image/png')

file = URI.open('https://catalog.extension.oregonstate.edu/sites/catalog/files/project/html/images/screenshot2018-02-20at22522pm.png')

project = Project.create!(name: "Interstate Hazelnut Orchard", amount: rand(5..150)*100000, funded: false,
  location: "Marion County, OR", crop: "Hazelnuts",
  description: "The farm is located along Interstate-5, 30 miles south of Portland, OR. This acquisition is a 12-year hold with a net IRR of 10.2% and a net average cash yield of 5.1%. The offering consists of a land purchase with a lease to RaptorAg, a trusted partner; this is our fourth deal with RaptorAg. At exit in year 12, the property will be sold. By that time we expect the trees to be fully mature, turnkey, and of interest to large growers and institutional investors.",
  start_date: Faker::Date.between(from: '2021-03-15', to: '2021-12-31'),
  maturity_date: Faker::Date.between(from: '2026-03-15', to: '2036-12-31').end_of_month,
  ltv_ratio: 0.35, management_fee: 0.01, transaction_fee: 0.02)

project.banner_picture.attach(io: file, filename: 'hazelnuts-orchad.png', content_type: 'image/png')

file = URI.open('https://www.sandjmandarins.com/wp-content/gallery/blog-gallery/mandarin-grove.jpg')

project = Project.create!(name: "Garcia Mandarin Grove", amount: rand(5..150)*100000, funded: false,
  location: "Tulare County, CA", crop: "Mandarins",
  description: "The farm consists of 15.8 acres planted to navels. It is located ~1 mile SW of our 18-acre mandarin farm in Orosi, CA. The strategy is to develop 100% of the property from old legacy navels to high-margin, organic mandarins (“tango” variety). Green Leaf Farms would develop and manage the property. ",
  start_date: Faker::Date.between(from: '2021-03-15', to: '2021-12-31'),
  maturity_date: Faker::Date.between(from: '2026-03-15', to: '2036-12-31').end_of_month,
  ltv_ratio: 0.36, management_fee: 0.01, transaction_fee: 0.02)

project.banner_picture.attach(io: file, filename: 'mandarin-grove.png', content_type: 'image/png')

# TO BE CHANGED FROM HERE

file = URI.open('https://i.pinimg.com/originals/c4/82/14/c4821446d3c902647a6ea0cf39f38419.jpg')

project = Project.create!(name: "Yuba Almond Orchard", amount: rand(5..150)*100000, funded: false,
  location: "Yuba County, CA", crop: "Almonds",
  description: "Yuba Almond Orchard is located near Plumas Lake, in Yuba City, CA, consisting of 185 acres planted to young almond trees. The farm has prime soils and three deep, high yielding wells with good water quality. We have excellent operators identified in the area and are finalizing an agreement. This acquisition is a 10-year hold with a net IRR of 11.1% and a net average cash yield of 9.1%. The cash yield increases substantially in years 3 and 4 as the trees reach maturity. FarmTogether successfully negotiated a purchase price $225K below listing price. At exit, this property will be a turnkey operation attractive to large growers and investors.",
  start_date: Faker::Date.between(from: '2021-03-15', to: '2021-12-31'),
  maturity_date: Faker::Date.between(from: '2026-03-15', to: '2036-12-31').end_of_month,
  ltv_ratio: 0.41, management_fee: 0.01, transaction_fee: 0.02)

project.banner_picture.attach(io: file, filename: 'mandarin-grove.png', content_type: 'image/png')

file = URI.open('https://catalog.extension.oregonstate.edu/sites/catalog/files/project/html/images/screenshot2018-02-20at22522pm.png')

project = Project.create!(name: "Brody Hazelnut Orchard", amount: rand(5..150)*100000, funded: false,
  location: "Benton County, OR", crop: "Hazelnuts",
  description: "This investment opportunity is in Benton County, Oregon, and is a 100% hazelnut development. Our partner, Raptor, executed a lease with the current owner, with a one-year term, in September 2019, with a purchase option through September 2020. Raptor will purchase the land and then straight away sell it to FarmTogether investors at the exact same price. FarmTogether will buy the land and pay for the hazelnut development. Raptor will have a 40-year lease of the property with most of the lease payment fixed (93% of cash yield) and a small crop revenue share (7% of cash yield). The lease escalates at 1% a year. In year 10 the land with the attached lease will be sold, either to Raptor or 3rd parties. Given the attractive nature of the land, the lease, and the location, we expect the sale price and process to be quite favourable.",
  start_date: Faker::Date.between(from: '2021-03-15', to: '2021-12-31'),
  maturity_date: Faker::Date.between(from: '2026-03-15', to: '2036-12-31').end_of_month,
  ltv_ratio: 0.31, management_fee: 0.01, transaction_fee: 0.02)

project.banner_picture.attach(io: file, filename: 'other-hazelnut.png', content_type: 'image/png')

file = URI.open('https://s.abcnews.com/images/International/GTY_Iowa_Cornfield_MEM_161006_16x9_1600.jpg')

project = Project.create!(name: "Doris Farm", amount: rand(5..150)*100000, funded: true,
  location: "Stephenson County, IL", crop: "Soybeans",
  description: "This investment is a unique opportunity to own top quality row crop farmland sourced and managed by a highly experienced institutional-level investment firm, Farmland Opportunity. Until today, access to this firm has only been open to ultra-high net worth individuals and family offices. This row crop farm is located in prime farm country in Illinois, has an excellent soil index, and a highly professional farmer that already signed a 3-year lease with us. The deal is completely off-market and came through proprietary relationships, which allowed us to get the deal at a 10%+ discount to market.",
  start_date: Faker::Date.between(from: '2021-03-15', to: '2021-12-31'),
  maturity_date: Faker::Date.between(from: '2026-03-15', to: '2036-12-31').end_of_month,
  ltv_ratio: 0, management_fee: 0.01, transaction_fee: 0.02)

project.banner_picture.attach(io: file, filename: 'soybeans.png', content_type: 'image/png')

file = URI.open('https://catalog.extension.oregonstate.edu/sites/catalog/files/project/html/images/screenshot2018-02-20at22522pm.png')

project = Project.create!(name: "Jupiter Farm", amount: rand(5..150)*100000, funded: true,
  location: "Tulare County, CA", crop: "Walnuts",
  description: "Jupiter Farm is a turnkey walnut and almond farm located on the east side of Tulare County in California's Central Valley. It is comprised of 70 planted acres, with 54 acres of mature walnuts planted to the premium Chandler variety and 16 acres of Independence almonds planted in 2019. This property has prime soils (Class 1 and Class 2) and abundant water. The property has riparian water rights to the Tule River and high yielding groundwater wells.",
  start_date: Faker::Date.between(from: '2021-03-15', to: '2021-12-31'),
  maturity_date: Faker::Date.between(from: '2026-03-15', to: '2036-12-31').end_of_month,
  ltv_ratio: 0.39, management_fee: 0.01, transaction_fee: 0.02)

project.banner_picture.attach(io: file, filename: 'walnut-grove.png', content_type: 'image/png')

file = URI.open('https://www.sandjmandarins.com/wp-content/gallery/blog-gallery/mandarin-grove.jpg')

project = Project.create!(name: "Chester Farm", amount: rand(5..150)*100000, funded: true,
  location: "Tulare County, CA", crop: "Oranges",
  description: "This excellent property is an almond and orange farm in a prime growing region in California. It is located in the eastern portion of the Tulare County in the Sierra Nevada Foothills and is a couple of miles north of the recently acquired Orosi Mandarin property. This farm offers attractive property-level diversification. It has 53.5 planted acres comprised of 35 acres of almonds planted in 2014 and 18.5 acres of navel oranges planted in 2000. The oranges are mature producing and the almonds are 2-3 years away from reaching peak production. The property is irrigated with two groundwater wells and Class 1 surface water rights.",
  start_date: Faker::Date.between(from: '2021-03-15', to: '2021-12-31'),
  maturity_date: Faker::Date.between(from: '2026-03-15', to: '2036-12-31').end_of_month,
  ltv_ratio: 0.25, management_fee: 0.01, transaction_fee: 0.02)

project.banner_picture.attach(io: file, filename: 'orange-grove.png', content_type: 'image/png')

Project.all.each do |project|
  date2 = project.maturity_date
  date1 = project.start_date
  counter = (date2.year - date1.year) * 12 + date2.month - date1.month - (date2.day >= date1.day ? 0 : 1)
  for i in (0...counter) do
    CashYield.create(date: (date1 + i.month).end_of_month, value: (project.amount * rand(0.001..0.005)).round(2), project: project)
  end
  CashYield.create(date: project.maturity_date, value: (project.amount * rand(0.001..0.005) + project.amount * rand(1.05..1.2)).round(2), project: project)
end

file = URI.open('https://avatars.githubusercontent.com/u/62432059?s=460&u=d90bafa134b175d53f7904cfc6e5322a4039b6a6&v=4')
user = User.create(name: 'Boris Nikiforov', email: 'boris@blink.com', password: 'password')
user.photo.attach(io: file, filename: "#{user.email}-photo.png", content_type: 'image/png')
file = URI.open('https://avatars.githubusercontent.com/u/74435802?s=460&u=d0d9922fe1e27a0aa4904ed60bad5427bce7cd9e&v=4')
user = User.create(name: 'Shahabal Shahzad', email: 'shahabal@blink.com', password: 'password')
user.photo.attach(io: file, filename: "#{user.email}-photo.png", content_type: 'image/png')
file = URI.open('https://avatars.githubusercontent.com/u/72731566?s=400&u=a25ad0a4bb38e96526a9b4043f015f594399d33e&v=4')
user = User.create(name: 'Zacharie Tournant', email: 'zach@blink.com', password: 'password')
user.photo.attach(io: file, filename: "#{user.email}-photo.png", content_type: 'image/png')
file = URI.open('https://avatars.githubusercontent.com/u/6656014?s=460&u=40ba8df8a2f5a87e990034439a8118dde60e7053&v=4')
user = User.create(name: 'Sy Rashid', email: 'sy@blink.com', password: 'password')
user.photo.attach(io: file, filename: "#{user.email}-photo.png", content_type: 'image/png')
file = URI.open('https://avatars.githubusercontent.com/u/74418527?s=460&u=74956cfaa098b6d3cb3c9346145d30c560da1dc1&v=4')
user = User.create(name: 'Sevil Hatipoğlu', email: 'sevil@blink.com', password: 'password')
user.photo.attach(io: file, filename: "#{user.email}-photo.png", content_type: 'image/png')
file = URI.open('https://avatars.githubusercontent.com/u/76554770?s=460&u=ddc91eb8279e100beef0db0edfa636ad35a5bede&v=4')
user = User.create(name: 'Issam Khairullah', email: 'issam@blink.com', password: 'password')
user.photo.attach(io: file, filename: "#{user.email}-photo.png", content_type: 'image/png')
file = URI.open('https://avatars.githubusercontent.com/u/77265306?s=460&u=cb721e2839e0f88dc1509bcfffa4eebadb61a687&v=4')
user = User.create(name: 'Hendrik Vermeersch', email: 'hendrik@blink.com', password: 'password')
user.photo.attach(io: file, filename: "#{user.email}-photo.png", content_type: 'image/png')
file = URI.open('https://avatars.githubusercontent.com/u/32864499?s=400&u=db64e56f2da13fd849613d693a0c589e54fcddcf&v=4')
user = User.create(name: 'Yair Gordon', email: 'yair@blink.com', password: 'password')
user.photo.attach(io: file, filename: "#{user.email}-photo.png", content_type: 'image/png')






Project.first(7).each do |project|
  User.all.each do |user|
    Subscription.create(project: project, user: user, amount: (project.amount * rand(0.025..0.125)).round(2))
  end
end

Project.last(3).each do |project|
  User.all.each do |user|
    Subscription.create(project: project, user: user, amount: (project.amount * 0.125).round(2))
  end
end

crops = []
Project.all.each do |project|
  crops << project.crop
end
crops.each do |crop|

  InvestmentHighlight.create(project: Project.find_by(crop: crop), title: 'Growing Market', content: "#{crop}s are one of the most popular tree nuts in the United States and abroad. They have grown in popularity due to increased snacking, rising incomes in developing countries, and the proven health benefits of consuming nuts. In addition, US #{crop}s are backed by a strong trade association, the American #{crop} Growers, which is set to invest in its largest advertising and marketing campaign to date to help drive demand in 2021. The United States is the largest producer of #{crop}s in the world.")
  InvestmentHighlight.create(project: Project.find_by(crop: crop), title: 'Early Cash Flow', content: "Fawn Creek Orchard is modeled conservatively and priced in line with historical averages and current market conditions. Half the trees are projected to yield a crop in 2022; the other half should begin producing the following year. #{crop} trees exhibit alternate-bearing tendencies, which is why you see a fluctuation in cash-yield once the trees reach maturity. The net average cash yield is projected at 8.0%.")
  InvestmentHighlight.create(project: Project.find_by(crop: crop), title: 'Investment Deep-Dive', content: "Watch our pre-launch deep dive on Fawn Creek #{crop} Orchard. We discuss what makes this deal an exceptionally strong addition to your portfolio and what’s driving the growing demand of #{crop}s.")
  InvestmentHighlight.create(project: Project.find_by(crop: crop), title: 'Financial Summary', content: "This deal is modeled as a 10-year hold with a target net IRR of 9.5%, a target net average cash yield of 8.0%, and a target multiple on invested capital of 2.1x. Net cash yield averages 3.5% in the first five years and 12.5% in the remaining five years. The offer price is $2,000,000, or $100,000 (5.0%) below the asking price. At exit, we believe this will be attractive to large growers and investors.")
  InvestmentHighlight.create(project: Project.find_by(crop: crop), title: 'Fees', content: "All fees are applicable upon deal closure. FarmTogether will not charge fees during the syndication period or if the deal is canceled prior to close. Fees for Fawn Creek are calculated as percentages of the Total Deal Size (Project Basis), which means the sum of FarmTogether Client Equity, Purchase Debt, and Development Debt.")
  InvestmentHighlight.create(project: Project.find_by(crop: crop), title: 'Ownership Structure', content: "Investments are structured as interests in FarmTogether 206, LLC that in turn will directly own, either as the sole fee title owner or as a tenant in common owner with other tenant in common owners, which may or may not be members of FarmTogether 206, LLC, the title to Fawn Creek #{crop} Orchard. The investors, through the LLC, thus fully own that portion of the asset owned by FarmTogether 206, LLC.")
  InvestmentHighlight.create(project: Project.find_by(crop: crop), title: 'Risks & Rating', content: "There is a risk factors list related to the Fawn Creek #{crop} Orchard where each factor is judged to qualitatively add to the overall Risk profile. Each factor section has an explanation as to why the risk matters. Each risk is graded where the higher the number - the higher the risk. Combined, these factors converge to one position on our Risk-Reward Spectrum.")

end

puts "Seeding was completed. You now have #{Project.count} projects, #{CashYield.count} cash flows, #{User.count} users, #{Subscription.count} subscriptions, #{InvestmentHighlight.count} investment highlights"

