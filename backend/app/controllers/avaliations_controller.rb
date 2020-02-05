# frozen_string_literal: true

class AvaliationsController < ApplicationController
  before_action :set_avaliation, only: %i[update destroy]
  before_action :authorize_user, except: %i[index show]

  def index
    render json: policy_scope(Avaliation), status: :ok
  end

  def show
    avaliation = policy_scope(Avaliation).find_by(id: params[:id])

    if avaliation.present?
      render json: avaliation, status: :ok
    else
      invalid_avaliation
    end
  end

  def create
    avaliation = current_user.received_avaliations.new(params.require(:avaliation).permit(
                                                         :evaluated_id,
                                                         :observations,
                                                         :organization,
                                                         :responsibility,
                                                         :proactivity,
                                                         :team_work,
                                                         :creativity,
                                                         :focus
                                                       ))

    if avaliation.save
      render json: avaliation.id, status: :created
    else
      render json: avaliation.errors, status: :unprocessable_entity
    end
  end

  def update
    attributes = params.require(:avaliation).permit(
      :observations,
      :organization,
      :responsibility,
      :proactivity,
      :team_work,
      :creativity,
      :focus
    )

    if @avaliation.update_attributes(attributes)
      render json: @avaliation.id, status: :created
    else
      render json: @avaliation.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @avaliation.destroy
    render body: nil
  end

  private

  def set_avaliation
    @avaliation = current_user.received_avaliations.find_by(id: params[:id])

    invalid_avaliation if @avaliation.blank?
  end

  def invalid_avaliation
    render json: 'Avaliação inválida', status: :not_found
  end

  def authorize_user
    authorize Avaliation
  end
end
