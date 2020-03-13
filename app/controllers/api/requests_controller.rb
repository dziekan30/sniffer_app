class Api::RequestsController < ApplicationController
  before_action :authenticate_user
  
  def index
    @requests = Request.all
    render 'index.json.jb'
  end

  def create

    @request = Request.new(
                            user_id: current_user.id,
                            dog_id: params[:dog_id],
                            approved: false
                          )

    @request.save
    render 'show.json.jb'
  
  end
 
  def show
    @request = Request.find(params[:id])
    render "show.json.jb"
  end

  def  update
    @request = Request.find(params[:id])

    if current_user.id == @request.user_id
      @request.dog_id = params[:dog_id]
      @request.approved = params[:approved]

      if @request.save
        render "show.json.jb"
      else
        render json: {errors: @request.errors.full_messages}, status: :unprocessable_entity
      end
    else 
      render json: {}, status: :unauthorized
    end
  end

  def destroy
    request = Request.find(params[:id])
    request.destroy
    render json: {message: "Request successfully destroyed"}
  end

end
