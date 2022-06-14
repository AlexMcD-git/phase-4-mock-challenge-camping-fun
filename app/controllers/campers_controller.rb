class CampersController < ApplicationController
    def index
        render json: Camper.all, status: 200
    end

    def show
        camper = Camper.find(params[:id])
        render json: camper, include: :activities, status: 200
    end

    def create
        camper = Camper.create!(camper_params)
        render json: camper, status: :created
    end

    private

    def camper_params
        params.permit(:name, :age)
    end
end
