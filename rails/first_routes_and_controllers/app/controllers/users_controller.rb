class UsersController < ApplicationController
  def index
    users = User.all
    hash = Hash.new
    users.each do |user|
      hash[user.id] = user 
    end
    render json: hash
  end

  def show
    user = User.find(params[:id])

    if user
      render json: user
    else
      render json: user.errors.full_messages, status: :unprocessable_entity
    end
  end

  def create
    user = user_params    

    if user.save
      render json: user
    else
      render json: user.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    user = User.find(params[:id])

    if user.destroy
      render json: user 
    else
      render json: user.errors.full_messages, status: :unprocessable_entity
    end
  end

  def update
    user = User.find(params[:id])

    if user.update_attributes(user_params)
      render json: user
    else
      render json: user.errors.full_messages, status: :unprocessable_entity
    end
  end

  private
  
  def user_params
    params.require(:user).permit(:name, :email)
  end

end
