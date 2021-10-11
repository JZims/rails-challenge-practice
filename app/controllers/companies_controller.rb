class CompaniesController < ApplicationController
    before_action :set_company, only: [:show]

    def show
    end

    def new 
        @company = Company.new
    end

    def create
        byebug
        @company = Company.new(company_params)

     

    end

    private

    def company_params
        params.require(:company).permit(:name)
    end

    def set_company
        @company = Company.find(company_params[:name])
    end

end