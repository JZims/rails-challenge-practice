class BuildingsController < ApplicationController
    before_action :set_building, only: [:show, :edit, :update]

    def index
        @buildings = Building.all
    end

    def update
        @building[:name] = params[:building][:name]
        @building[:country] = params[:building][:country]
        @building[:address] = params[:building][:address]
        @building[:rent_per_floor] = params[:building][:rent_per_floor]
        @building[:number_of_floors] = params[:building][:number_of_floors]
        @building.save
        
        if @building.save
            flash[:success] = "Building information updated successfully!"
        
            redirect_to "/buildings"
        else 
            flash[:error] = "Please try again."
        end
    end
  
    private

    def set_building
        @building = Building.find(params[:id])
    end
end