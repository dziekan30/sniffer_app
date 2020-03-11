class Api::ImagesController < ApplicationController
  def index
    @images = Image.all
    render 'index.json.jb'
  end

  def create
    @image = Image.new(
                         image_url: params[:image_url],
                         dog_id: params[:dog_id]
                        )
    
    if @image.save
      render "show.json.jb"
    else
      render json: {errors: @image.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def show
    @image = Image.find(params[:id])
    render 'show.json.jb'
  end

  def update
    @image = Image.find(params[:id])

    @image.image_url = params[:image_url] || @image.image_url
    @image.dog_id = params[:dog_id] || @image.dog_id

    if @image.save
      render 'show.json.jb'
    else
      render json: { errors: @image.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    image = Image.find(params[:id])
    image.destroy
    render json: {message: "Image successfully destroyed"}
  end
end
