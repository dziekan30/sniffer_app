class Api::DogsController < ApplicationController
  # before_action :authenticate_user, only: [:create, :update, :destroy]
  def index

    # if current_user
    #   @dogs = current_user.dogs
    #   render 'index.json.jb'
    # else
    #   render 'index.json.jb'
    #   # render json: {}
    # end

    @dogs = Dog.all

    search_term = params[:search]
    breed_search = params[:breed]
    
    if search_term
      @dogs = @dogs.where("name iLIKE ?", "%#{ search_term }%")
    end

    if breed_search
      breed = Breed.find_by(name: breed_search)
      @dogs = breed.dogs
    end

    render 'index.json.jb'

  end

  def show
    @dog = Dog.find(params[:id])
    render 'show.json.jb'
  end

  def create
    @dog = Dog.new(
                  user_id: current_user.id,
                  name: params[:name],
                  breed_description: params[:breed_description],
                  bio: params[:bio],
                  active_status: params[:active_status],
                  size: params[:size],
                  latitude: params[:latitude],
                  longitude: params[:longitude],
                  price: params[:price],
                  address: params[:address],
                  city: params[:city],
                  zipcode: params[:zipcode]
                  )
    if @dog.save
      params[:breed_ids].each do |breed_id|
        Makeup.create(
                     breed_id: breed_id,
                     dog_id: @dog.id
                    )
      end

      render "show.json.jb"
    else
      render json: {errors: @dog.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def update
    @dog = Dog.find(params[:id])

    @dog.name = params[:name] || @dog.name
    @dog.breed_description = params[:breed_description] || @dog.breed_description
    @dog.bio = params[:bio] || @dog.bio
    @dog.active_status = params[:active_status] || @dog.active_status
    @dog.size = params[:size] || @dog.size
    @dog.latitude = params[:latitude] || @dog.latitude
    @dog.longitude = params[:longitude] || @dog.longitude
    @dog.user_id = params[:user_id] || @dog.user_id
    @dog.price = params[:price] || @dog.price
    @dog.address = params[:address] || @dog.address
    @dog.city = params[:city] || @dog.city
    @dog.zipcode = params[:zipcode] || @dog.zipcode
              
    if @dog.save
      @dog.makeups.destroy_all

      params[:breed_ids].each do |breed_id|
        Makeup.create(
                     breed_id: breed_id,
                     dog_id: @dog.id
                    )
      end
      
      render "show.json.jb"
    else
      render json: {errors: @dog.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    dog = Dog.find(params[:id])
    dog.destroy
    render json: {message: "Dog successfully destroyed!!!! Muhahahahahahaha!!!"}
  end

end
