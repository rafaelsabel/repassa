# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pundit

  protect_from_forgery with: :exception

  before_action :authenticate_user!
  skip_before_action :verify_authenticity_token

  rescue_from Pundit::NotAuthorizedError, with: :unauthorized

  private

  def unauthorized
    render json: 'Não autorizado.', status: :unauthorized
  end
end
