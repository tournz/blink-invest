require 'date'
require 'open-uri'

puts "Clearing the database of all existing elements"
CashYield.destroy_all
Subscription.destroy_all
Project.destroy_all
User.destroy_all

file = URI.open('https://i.pinimg.com/originals/c4/82/14/c4821446d3c902647a6ea0cf39f38419.jpg')

project = Project.create!(name: "Fawn Creek Pistachio Orchard", amount: rand(5..150)*100000, funded: false,
            location: "Tulare County, California", latitude: 36.18721402636546, longitude: -119.26999767516067, crop: "Pistachios",
            description: "Fawn Creek is comprised of 60 contiguous acres in Tulare County, California, approximately 4 miles north east of our Deer Creek Pistachio Orchard - both located in the same county. Of the 60 gross acres, 100% are planted to Golden Hills variety pistachios. Half the trees were planted in 2016 and the other half was planted in 2018. This deal is modeled as a 10-year hold with a target net IRR of 9.5%, a target net average cash yield of 8.0%, and a target multiple on invested capital of 2.1x. Net cash yield averages 3.5% in the first five years and 12.5% in the remaining five years. The purchase price is $2,000,000, or $100,000 (5.0%) below the listed asking price. At exit, we believe this will be attractive to large growers and investors.",
            start_date: Faker::Date.between(from: '2021-03-15', to: '2021-12-31'),
            maturity_date: Faker::Date.between(from: '2026-03-15', to: '2036-12-31').end_of_month,
            ltv_ratio: 0.4, management_fee: 0.01, transaction_fee: 0.02)

project.banner_picture.attach(io: file, filename: 'pistachios-orchad.png', content_type: 'image/png')

file = URI.open('https://s.abcnews.com/images/International/GTY_Iowa_Cornfield_MEM_161006_16x9_1600.jpg')

project = Project.create!(name: "Rinehart Farm", amount: rand(5..150)*100000, funded: false,
            location: "Stephenson County, Illinois", latitude: 42.39539389988422, longitude: -89.6978462139904, crop: "Corn",
            description: "This investment is a unique opportunity to own top quality row crop farmland sourced and managed by a highly experienced institutional-level investment firm, Farmland Opportunity. The Rinehart Farm comprises 157 acres in one contiguous lot located in prime farm country in Stephenson County, Illinois. The deal is completely off-market and came through proprietary relationships, which allowed us to get the deal at a 7%+ discount to market.",
            start_date: Faker::Date.between(from: '2021-03-15', to: '2021-12-31'),
            maturity_date: Faker::Date.between(from: '2026-03-15', to: '2036-12-31').end_of_month,
            ltv_ratio: 0, management_fee: 0.01, transaction_fee: 0.02)

project.banner_picture.attach(io: file, filename: 'cornfield.png', content_type: 'image/png')

file = URI.open('https://www.fruitandveggie.com/wp-content/uploads/2019/12/3106bf9bc778356da6f1eeb1f4ca0f5d.jpg')

project = Project.create!(name: "Galaxy Organic Apple Orchard", amount: rand(5..150)*100000, funded: false,
            location: "Franklin County, WA", latitude: 46.53086446674697, longitude: -119.18379034020343, crop: "Apples",
            description: "Galaxy Apple Orchard is located in the heart of Washington’s apple belt, Franklin County, WA. The orchard consists of 201 acres planted to mature apple trees. The plan is to redevelop 100% of the property into an organic apple orchard over the next 2 years. The soils are suitable for this organic transition; we project to plant two premium varietals, Cosmic Crisp® and SweeTango®, praised for their balanced flavor profile and backed by strong marketing efforts. We have identified an excellent operator in the area, Stemilt Growers, and are finalizing an agreement with them. This acquisition is a 10-year hold with a target net IRR of 15.0% and a target net average cash yield of 19.6%. At exit, this property will be a turnkey operation attractive to large growers and investors.",
            start_date: Faker::Date.between(from: '2021-03-15', to: '2021-12-31'),
            maturity_date: Faker::Date.between(from: '2026-03-15', to: '2036-12-31').end_of_month,
            ltv_ratio: 0.39, management_fee: 0.01, transaction_fee: 0.02)

project.banner_picture.attach(io: file, filename: 'apples-orchad.png', content_type: 'image/png')

file = URI.open('https://catalog.extension.oregonstate.edu/sites/catalog/files/project/html/images/screenshot2018-02-20at22522pm.png')

project = Project.create!(name: "Interstate Hazelnut Orchard", amount: rand(5..150)*100000, funded: false,
            location: "Marion County, OR", latitude: 44.92211034138069, longitude: -122.92322045163124, crop: "Hazelnuts",
            description: "The farm is located along Interstate-5, 30 miles south of Portland, OR. This acquisition is a 12-year hold with a net IRR of 10.2% and a net average cash yield of 5.1%. The offering consists of a land purchase with a lease to RaptorAg, a trusted partner; this is our fourth deal with RaptorAg. At exit in year 12, the property will be sold. By that time we expect the trees to be fully mature, turnkey, and of interest to large growers and institutional investors.",
            start_date: Faker::Date.between(from: '2021-03-15', to: '2021-12-31'),
            maturity_date: Faker::Date.between(from: '2026-03-15', to: '2036-12-31').end_of_month,
            ltv_ratio: 0.35, management_fee: 0.01, transaction_fee: 0.02)

project.banner_picture.attach(io: file, filename: 'hazelnuts-orchad.png', content_type: 'image/png')

file = URI.open('https://www.sandjmandarins.com/wp-content/gallery/blog-gallery/mandarin-grove.jpg')

project = Project.create!(name: "Garcia Mandarin Grove", amount: rand(5..150)*100000, funded: false,
            location: "Tulare County, CA", latitude: 36.4431638139268, longitude: -119.20371642943962, crop: "Mandarins",
            description: "The farm consists of 15.8 acres planted to navels. It is located ~1 mile SW of our 18-acre mandarin farm in Orosi, CA. The strategy is to develop 100% of the property from old legacy navels to high-margin, organic mandarins (“tango” variety). Green Leaf Farms would develop and manage the property. ",
            start_date: Faker::Date.between(from: '2021-03-15', to: '2021-12-31'),
            maturity_date: Faker::Date.between(from: '2026-03-15', to: '2036-12-31').end_of_month,
            ltv_ratio: 0.36, management_fee: 0.01, transaction_fee: 0.02)

project.banner_picture.attach(io: file, filename: 'mandarin-grove.png', content_type: 'image/png')

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

Project.all.each do |project|
  User.all.each do |user|
    Subscription.create(project: project, user: user, amount: (project.amount * rand(0.05..0.25)).round(2))
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

