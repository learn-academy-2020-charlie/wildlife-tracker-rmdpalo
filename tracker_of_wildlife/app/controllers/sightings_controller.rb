class SightingsController < ApplicationController
    def index
        sightings = Sighting.all 
        render json: sightings
    end

    def create
        sighting = Sighting.create(sighting_params)
        if sighting.valid?
            render json: sighting
        else
            render json: sighting.errors
        end
    end

    def update
        sighting = Sighting.find(params[:id])
        sighting.update(sighting_params)
            if sighting.valid?
                render json: sighting
            else
                render json: sighting.errors
            end
    end

    def destroy
        sighting = Sighting.find(params[:id])
        if sighting.destroy
            render json: sighting
        else
            render json: sighting.errors
        end
    end

    def report
        sightings = Sighting.where("date >= :start_date AND date <= :end_date",{start_date: params[:start_date], end_date: params[:end_date]})
        render json: sightings
    end

    private
    def sighting_params
        params.require(:sighting).permit(:date, :latitude, :longitude, :animal_id, :start_date, :end_date)
    end
end
