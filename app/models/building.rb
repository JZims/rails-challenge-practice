class Building < ApplicationRecord

  has_many :offices, :dependent => :delete_all
  has_many :companies, through: :offices

  def total_rent_income 
    #finds how many offices are taking up floors in the building
    self.offices.count * self.rent_per_floor
  end

  def companies_with_offices
    self.companies
  end
 

  def number_of_floors_available
    # Will not work until relationships and schema are corretly setup

    all_floors = Array(1..self.number_of_floors)
    self.offices.each do |office|
      all_floors.delete(office.floor)
    end
    all_floors
  end

  def empty_offices
    number_of_floors_available.map { |f| offices.build(floor: f) }
  end

end
