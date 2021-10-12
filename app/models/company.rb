class Company < ApplicationRecord
    has_many :offices, :dependent => :delete_all
    has_many :buildings, through: :offices
    has_many :employees,:dependent => :delete_all

    accepts_nested_attributes_for :employees
    accepts_nested_attributes_for :offices

    def office_info
        self.offices.map do |office|
            "#{office.building.name}  F#{office.floor} - $#{office.building.rent_per_floor}"
        end
    end

    def employee_list
        self.employees.map do |employee|
            "#{employee.name}  -  #{employee.title}"
        end
    end

end
