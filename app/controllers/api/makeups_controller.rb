class Api::MakeupsController < ApplicationController

  def index
    @makeups = Makeup.all
    render 'index.json.jb'
  end

  def show
    @makeup = Makeup.find(params[:id])
    render 'show.json.jb'
  end

  def create
    @makeup = Makeup.new(
                          dog_id: params[:dog_id],
                          breed_id: params[:breed_id]
                           )

    if @makeup.save
      render "show.json.jb"
    else
      render json: {errors: @makeup.errors.full_messages}, status: :unprocessable_entity
    end  
  end

  def update
    @makeup = Makeup.find(params[:id])

      @makeup.dog_id = params[:dog_id] || @makeup.dog_id
      @makeup.breed_id = params[:breed_id] || @makeup.breed_id

    if @makeup.save
      render "show.json.jb"
    else
      render json: {errors: @makeup.errors.full_messages}, status: :unprocessable_entity
    end
  
  end
end
