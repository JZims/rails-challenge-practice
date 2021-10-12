class CompaniesController < ApplicationController
    before_action :set_company, only: [:show, :office_info]

    def show
        @employee = Employee.new

    end

    def new 
        @company = Company.new
    end

    def create
        #from params, make instances of a new company
        @company = Company.new(company_params)

        # if company is valid and saved, loop through nested attribute response 
        # finding the appropriate building for each response and creating an office instance 
        # for that company in the specified building

        if @company.save

                params[:company][:offices_attributes].each do |key, building_data|
                    building = Building.find(building_data[:id])

                    if building
                        floors = building_data[:offices]

                        floors.each do |floor|
                        if !floor.empty?
                            Office.create!(building: building, company: @company, floor: floor)
                        end
                    end
                end
            end
            redirect_to @company
        end
       
    end

    def add_employee
        @employee = Employee.new(employee_params)

        if @employee.save
            redirect_to @employee.company
        end
    end

    def update

    end

    def delete

    end

    

    private

    def company_params
        params.require(:company).permit(:name)
    end

    def employee_params
        params.require(:employee).permit(:name, :title, :company_id)
    end

    def set_company
        @company = Company.find(params[:id])
    end

end