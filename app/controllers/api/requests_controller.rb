class Api::RequestsController < ApplicationController
  before_action :authenticate_user
  
  def index
    @requests = current_user.requests
    render 'index.json.jb'
  end

  def create

    @request = Request.new(
                            user_id: current_user.id,
                            dog_id: params[:dog_id],
                            approved: false
                          )

     if @request.save
      @client = Twilio::REST::Client.new(Rails.application.credentials.dig(:twilio, :account_sid), Rails.application.credentials.dig(:twilio, :auth_token))

      message = @client.messages.create(
                                   body: "Hi there! I'm interested adopting #{@request.dog.name}",
                                   # from: '+12312250904',
                                   
                                   # to:  @request.dog.owner.phone_number
                                )

      # render json: {message_sid: message.sid}

      render 'show.json.jb'
    
    else 
      render json: {errors: @request.errors.full_messages}, status: :unprocessable_entity
    end

  end
 
  def show
    @request = Request.find(params[:id])
    render "show.json.jb"
  end

  def  update
    @request = Request.find(params[:id])

    if current_user.id == @request.dog.user_id
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
