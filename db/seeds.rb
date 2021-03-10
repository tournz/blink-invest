require 'date'
puts "Clearing the database of all existing elements"
CashYield.destroy_all
Project.destroy_all
User.destroy_all
Subscription.destroy_all


Project.create!(name: "Fawn Creek Pistachio Orchard", amount: rand(5..150)*100000, funded: false,
            location: "Tulare County, California", latitude: 36.18721402636546, longitude: -119.26999767516067, crop: "Pistachios",
            description: "Fawn Creek is comprised of 60 contiguous acres in Tulare County, California, approximately 4 miles north east of our Deer Creek Pistachio Orchard - both located in the same county. Of the 60 gross acres, 100% are planted to Golden Hills variety pistachios. Half the trees were planted in 2016 and the other half was planted in 2018. This deal is modeled as a 10-year hold with a target net IRR of 9.5%, a target net average cash yield of 8.0%, and a target multiple on invested capital of 2.1x. Net cash yield averages 3.5% in the first five years and 12.5% in the remaining five years. The purchase price is $2,000,000, or $100,000 (5.0%) below the listed asking price. At exit, we believe this will be attractive to large growers and investors.",
            start_date: Faker::Date.between(from: '2021-03-15', to: '2021-12-31'),
            maturity_date: Faker::Date.between(from: '2026-03-15', to: '2036-12-31'),
            ltv_ratio: 0.4, management_fee: 0.01, transaction_fee: 0.02)


Project.create!(name: "Rinehart Farm", amount: rand(5..150)*100000, funded: false,
            location: "Stephenson County, Illinois", latitude: 42.39539389988422, longitude: -89.6978462139904, crop: "Corn",
            description: "This investment is a unique opportunity to own top quality row crop farmland sourced and managed by a highly experienced institutional-level investment firm, Farmland Opportunity. The Rinehart Farm comprises 157 acres in one contiguous lot located in prime farm country in Stephenson County, Illinois. The deal is completely off-market and came through proprietary relationships, which allowed us to get the deal at a 7%+ discount to market.",
            start_date: Faker::Date.between(from: '2021-03-15', to: '2021-12-31'),
            maturity_date: Faker::Date.between(from: '2026-03-15', to: '2036-12-31'),
            ltv_ratio: 0, management_fee: 0.01, transaction_fee: 0.02)


Project.create!(name: "Galaxy Organic Apple Orchard", amount: rand(5..150)*100000, funded: false,
            location: "Franklin County, WA", latitude: 46.53086446674697, longitude: -119.18379034020343, crop: "Apples",
            description: "Galaxy Apple Orchard is located in the heart of Washington’s apple belt, Franklin County, WA. The orchard consists of 201 acres planted to mature apple trees. The plan is to redevelop 100% of the property into an organic apple orchard over the next 2 years. The soils are suitable for this organic transition; we project to plant two premium varietals, Cosmic Crisp® and SweeTango®, praised for their balanced flavor profile and backed by strong marketing efforts. We have identified an excellent operator in the area, Stemilt Growers, and are finalizing an agreement with them. This acquisition is a 10-year hold with a target net IRR of 15.0% and a target net average cash yield of 19.6%. At exit, this property will be a turnkey operation attractive to large growers and investors.",
            start_date: Faker::Date.between(from: '2021-03-15', to: '2021-12-31'),
            maturity_date: Faker::Date.between(from: '2026-03-15', to: '2036-12-31'),
            ltv_ratio: 0.39, management_fee: 0.01, transaction_fee: 0.02)


Project.create!(name: "Interstate Hazelnut Orchard", amount: rand(5..150)*100000, funded: false,
            location: "Marion County, OR", latitude: 44.92211034138069, longitude: -122.92322045163124, crop: "Hazelnuts",
            description: "The farm is located along Interstate-5, 30 miles south of Portland, OR. This acquisition is a 12-year hold with a net IRR of 10.2% and a net average cash yield of 5.1%. The offering consists of a land purchase with a lease to RaptorAg, a trusted partner; this is our fourth deal with RaptorAg. At exit in year 12, the property will be sold. By that time we expect the trees to be fully mature, turnkey, and of interest to large growers and institutional investors.",
            start_date: Faker::Date.between(from: '2021-03-15', to: '2021-12-31'),
            maturity_date: Faker::Date.between(from: '2026-03-15', to: '2036-12-31'),
            ltv_ratio: 0.35, management_fee: 0.01, transaction_fee: 0.02)


Project.create!(name: "Garcia Mandarin Grove", amount: rand(5..150)*100000, funded: false,
            location: "Tulare County, CA", latitude: 36.4431638139268, longitude: -119.20371642943962, crop: "Mandarins",
            description: "The farm consists of 15.8 acres planted to navels. It is located ~1 mile SW of our 18-acre mandarin farm in Orosi, CA. The strategy is to develop 100% of the property from old legacy navels to high-margin, organic mandarins (“tango” variety). Green Leaf Farms would develop and manage the property. ",
            start_date: Faker::Date.between(from: '2021-03-15', to: '2021-12-31'),
            maturity_date: Faker::Date.between(from: '2026-03-15', to: '2036-12-31'),
            ltv_ratio: 0.36, management_fee: 0.01, transaction_fee: 0.02)

Project.all.each do |project|
  date2 = project.maturity_date
  date1 = project.start_date
  counter = (date2.year - date1.year) * 12 + date2.month - date1.month - (date2.day >= date1.day ? 0 : 1)
  for i in (0...counter) do
    CashYield.create(date: (date1 + i.month).end_of_month, value: project.amount * rand(0.001..0.005), project: project)
  end
  CashYield.create(date: project.maturity_date, value: project.amount * rand(1.05..1.2), project: project)
end


User.create(name: 'Boris', email: boris@blink.com, password: 'password')
User.create(name: 'Shahabal', email: shahabal@blink.com, password: 'password')
User.create(name: 'Zach', email: zach@blink.com, password: 'password')
User.create(name: 'Sy', email: sy@blink.com, password: 'password')

Project.all.each do |project|
  User.all.each do |user|
    Subscription.create(project: project, user: user, amount: project.amount * rand(0.05..0.25))
  end
end

puts "Seeding was completed. You now have #{Project.count} projects, #{CashYield.count} cash flows, #{User.count} users, #{Subscription.count} subscriptions"

# Add pictures for the projects in the assets folder
# Link the investment highlights to a project

# Project.create!(name: "Yuba Almond Orchard", amount: rand(5..150)*100000, funded: false,)
#            location: "Yuba County, CA", latitude: , longitude: , crop: "Almonds",
#            description: , start_date: Faker::Date.between(Date.parse('15/03/2021'), Date.parse('31/12/2021')),
#            maturity_date: Faker::Date.between(Date.parse('15/03/2026'), Date.parse('31/12/2036')))



# Project.create!(name: "Brody Hazelnut Orchard", amount: rand(5..150)*100000, funded: false,
#            location: "Benton County, OR", latitude: , longitude: , crop: "Hazelnuts",
#            description: , start_date: Faker::Date.between(Date.parse('15/03/2021'), Date.parse('31/12/2021')),
#            maturity_date: Faker::Date.between(Date.parse('15/03/2026'), Date.parse('31/12/2036')))



# Project.create!(name: "Doris Farm", amount: rand(5..150)*100000, funded: false,
#            location: "Stephenson County, IL", latitude: , longitude: , crop: "Soybeans",
#            description: , start_date: Faker::Date.between(Date.parse('15/03/2021'), Date.parse('31/12/2021')),
#            maturity_date: Faker::Date.between(Date.parse('15/03/2026'), Date.parse('31/12/2036')))



# Project.create!(name: "Jenner Junior Orchard", amount: rand(5..150)*100000, funded: false,
#            location: "Benton County, OR", latitude: , longitude: , crop: "Hazelnuts",
#            description: , start_date: Faker::Date.between(Date.parse('15/03/2021'), Date.parse('31/12/2021')),
#            maturity_date: Faker::Date.between(Date.parse('15/03/2026'), Date.parse('31/12/2036')))



# Project.create!(name: "Jupiter Farm", amount: rand(5..150)*100000, funded: false,
#            location: "Tulare County, CA", latitude: , longitude: , crop: "Walnuts",
#            description: , start_date: Faker::Date.between(Date.parse('15/03/2021'), Date.parse('31/12/2021')),
#            maturity_date: Faker::Date.between(Date.parse('15/03/2026'), Date.parse('31/12/2036')))



# Project.create!(name: "Hazelnut Orchard", amount: rand(5..150)*100000, funded: false,
#            location: "Linn County, OR", latitude: , longitude: , crop: "Hazelnuts",
#            description: , start_date: Faker::Date.between(Date.parse('15/03/2021'), Date.parse('31/12/2021')),
#            maturity_date: Faker::Date.between(Date.parse('15/03/2026'), Date.parse('31/12/2036')))



# Project.create!(name: "Edward Jenner Orchard", amount: rand(5..150)*100000, funded: false,
#            location: "Benton County, OR", latitude: , longitude: , crop: "Hazelnuts",
#            description: , start_date: Faker::Date.between(Date.parse('15/03/2021'), Date.parse('31/12/2021')),
#            maturity_date: Faker::Date.between(Date.parse('15/03/2026'), Date.parse('31/12/2036')))



# Project.create!(name: "Chester Farm", amount: rand(5..150)*100000, funded: false,
#            location: "Tulare County, CA", latitude: , longitude: , crop: "Oranges",
#            description: , start_date: Faker::Date.between(Date.parse('15/03/2021'), Date.parse('31/12/2021')),
#            maturity_date: Faker::Date.between(Date.parse('15/03/2026'), Date.parse('31/12/2036')))



# Project.create!(name: "Mandarin Farm", amount: rand(5..150)*100000, funded: false,
#            location: "Tulare County, CA", latitude: , longitude: , crop: "Mandarins",
#            description: , start_date: Faker::Date.between(Date.parse('15/03/2021'), Date.parse('31/12/2021')),
#            maturity_date: Faker::Date.between(Date.parse('15/03/2026'), Date.parse('31/12/2036')))



# Project.create!(name: "El Nido Almond Farm", amount: rand(5..150)*100000, funded: false,
#            location: "Merced County, CA", latitude: , longitude: , crop: "Almonds",
#            description: , start_date: Faker::Date.between(Date.parse('15/03/2021'), Date.parse('31/12/2021')),
#            maturity_date: Faker::Date.between(Date.parse('15/03/2026'), Date.parse('31/12/2036')))

