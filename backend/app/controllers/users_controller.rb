# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_user, only: %i[show update destroy]
  before_action :authorize_user

  def index
    render json: User.all, status: :ok
  end

  def show
    render json: @user, status: :ok
  end

  def create
    user = User.new(params.require(:user).permit(:name, :role, :email, :password))

    if user.save
      render json: user.id, status: :created
    else
      render json: user.errors, status: :unprocessable_entity
    end
  end

  def update
    if @user.update_attributes(params.require(:user).permit(:name, :role))
      render json: @user.id, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @user.destroy
    render body: nil
  end

  private

  def set_user
    @user = User.find_by(id: params[:id])

    render json: 'Usuário inválido', status: :not_found if @user.blank?
  end

  def authorize_user
    authorize User
  end
end
