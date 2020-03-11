class Api::DogsController < ApplicationController
  before_action :authenticate_user, only: [:create, :update, :destroy]
  def index
    if current_user
      @dogs = current_user.dogs
      render 'index.json.jb'
    else
      render json: {}
    end
    # @dogs = Dog.all
    # render 'index.json.jb'

    search_term = params[:search]
    name_option = params[:breed_description]
    # sort_attribute = params[:sort]
    # sort_order = params[:sort_order]
    # category_choice = params[:category]

    
    if search_term
      @products = @products.where("name iLIKE ?", "%#{ search_term }%")
    end

    if discount_option == "true"
      @products = @products.where("price < ?" , 1000)
    end
   

    # if sort_attribute && sort_order
    #   @products = @products.order(sort_attribute => sort_order) 
    # elsif sort_attribute
    #   @products = @products.order(sort_attribute)
    # else
    #   @products = @products.order(:id)
    # end

  end

  def show
    @dog = Dog.find(params[:id])
    render 'show.json.jb'
  end

  def create
    @dog = Dog.new(
                  id: params[:id],
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
                  # image_url: params[:image_url]
                  )
    if @dog.save
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
                  @dog.size = params[:size] ||  @dog.size
                  @dog.latitude = params[:latitude] || @dog.latitude
                  @dog.longitude = params[:longitude] || @dog.longitude
                  @dog.user_id = params[:user_id] || @dog.user_id
                  @dog.price = params[:price] || @dog.price
                  @dog.address = params[:address] || @dog.address
                  @dog.city = params[:city] || @dog.city
                  @dog.zipcode = params[:zipcode] || @dog.zipcode
                  
    if @dog.save!
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
