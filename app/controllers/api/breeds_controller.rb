class Api::BreedsController < ApplicationController
  def index
    @breeds = Breed.all
    render 'index.json.jb'
  end

  def show
     @breed = Breed.find(params[:id])
    render 'show.json.jb'
  end

  def create
    @breed = Breed.new(
                        name: params[:name]
                      )
    if @breed.save
      render "show.json.jb"
    else
      render json: {errors: @breed.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def update
    @breed = Breed.find(params[:id])

      @breed.name = params[:name] || @breed.name

    if @breed.save
      render "show.json.jb"
    else
      render json: {errors: @breed.errors.full_messages}, status: :unprocessable_entity
    end

  end

  def destroy
    breed = Breed.find(params[:id])
    breed.destroy
    render json: {message: "Breed successfully destroyed!!!! Muhahahahahahaha!!!"}
  end
end
