Building.destroy_all
Office.destroy_all
Company.destroy_all
Employee.destroy_all


weworks = [
  {name: "Finsbury Pavement",
   country: "UK",
   address: "131 Finsbury Pavement",
   rent_per_floor: 18000,
   number_of_floors: 8
  },
  {name: "Chelsea HQ",
   country: "US",
   address: "29 West 28th Street",
   rent_per_floor: 20000,
   number_of_floors: 20
  },
  {name: "Broadway",
   country: "US",
   address: "85 Broadway",
   rent_per_floor: 25000,
   number_of_floors: 6
  }
]

weworks.each do |we|
  # ActiveRecord Model.create! will error out if the creation fails. This will give us some feedback if `rails db:seed` does not work
  Building.create!(we)
end

companies = [
  "Microsoft",
  "Flatiron",
  "Green Peace",
  "FinFund LLC",
  "Inc'd Comics",
  "Blue Apron",
  "Dog the Bounty Hunter LLC"
]

companies.each do |company|
  Company.create!(name: company)
end

titles = [
  "CEO",
  "Engineer",
  "HR specialist",
  "Graphic designer",
  "CFO",
  "COO",
  "Instructor"
]

100.times do
  Employee.create!(
    name: Faker::Name.name_with_middle,
    title: titles.sample,
    company: Company.all.sample
  )
end

microsoft_uk = Office.create!({
  building: Building.find_by(name: "Finsbury Pavement"),
  company: Company.find_by(name: "Microsoft"),
  floor: 3
  })